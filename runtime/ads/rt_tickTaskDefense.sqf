/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Initially spawns objectives through a couple of functions, then it checks if players are close to those objectives and if
	so it spawns in units to defend it.
*/


[([(call I_fnc_findTaskPos)] call I_fnc_populateTask)] params ["_array"];

waitUntil {!(_array isEqualTo [])};

GLOBAL setVariable ["ADS_TASK_ALLOBJECTS", _array, true];

{
	[format ["ADS_TASK_%1", _x], [false, 0]] call I_fnc_setVariable; // [is active, timeout for dyn objects despawn]
	
	[{
		[(missionNamespace getVariable format ["ADS_TASK_%1", (_this select 0)]), (missionNamespace getVariable format ["ADS_TASK_%1_DYN_OBJECTS", (_this select 0)])] params ["_var", ["_objects", []]];
		
		if (((_var select 0) isEqualTo false)) then { // if is inactive
			if (count ([getPos (_this select 0), 800] call I_fnc_findPlayers) >= 1) then { // if players are in radius, then spawn and change to active
				[(_this select 0)] spawn I_fnc_createTaskGroup;
				[format ["ADS_TASK_%1", (_this select 0)], [true, (_var select 1)]] call I_fnc_setVariable;
				diag_log format ["ADS_TASK_%1: Active.", (_this select 0)];
			} else { // if players are not in radius and inactive then delete existing objects 
				if !(_objects isEqualTo []) then {
					[_objects] call I_fnc_deleteObjects;
					[format ["ADS_TASK_%1_DYN_OBJECTS", (_this select 0)], []] call I_fnc_setVariable;
					diag_log format ["ADS_TASK_%1: Inactive, deleted objects due to timeout.", (_this select 0)];
				};
			};
		} else { // if is active
			if (count ([getPos (_this select 0), 600] call I_fnc_findPlayers) <= 0) then { // if there are no players in radius increase timeout
				[format ["ADS_TASK_%1", (_this select 0)], [(_var select 0), (_var select 1) + 1]] call I_fnc_setVariable;
				diag_log format ["ADS_TASK_%1: No players in radius, timeout till deletion: %2.", (_this select 0), (_var select 1) + 1];
			};
				
			if ((count ([getPos (_this select 0), 600] call I_fnc_findPlayers) >= 1) and (_var select 1) > 0) then { // if players are found in radius again and timeout is over 0, reset back to 0
				[format ["ADS_TASK_%1", (_this select 0)], [(_var select 0), 0]] call I_fnc_setVariable;
			};
				
			if ((_var select 1) >= 10) then { // if timeout reaches 10, then set var select 0 as false AKA inactive.
				[format ["ADS_TASK_%1", (_this select 0)], [false, 0]] call I_fnc_setVariable;
			};
		};
			
		if !(alive (_this select 0)) then {
			[format ["ADS_TASK_%1", (_this select 0)], [nil, nil]] call I_fnc_setVariable;
			diag_log format ["ADS_TASK_%1: Task object destroyed, PFH removed.", (_this select 0)];
			[(_this select 1)] call CBA_fnc_removePerFrameHandler;
			
			{
				[_x] call I_fnc_deleteInactive;
			} forEach ([_objects] call I_fnc_returnGroupsFromArray);
		};
		
	}, 5, _x] call CBA_fnc_addPerFrameHandler;
} forEach _array;