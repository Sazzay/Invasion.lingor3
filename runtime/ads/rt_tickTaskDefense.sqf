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
	[format ["ADS_TASK_%1", _x], [false, [], false]] call I_fnc_setVariable;
} forEach _array;
// REWRITE THIS INTO MULTIPLE PFH'S INTO THE forEach _array!
[{
	{
		[(missionNamespace getVariable format ["ADS_TASK_%1", _x]), []] params ["_var", "_objects"];
	
		if (alive _x and ((_var select 0) isEqualTo false) and ((_var select 2) isEqualTo false) and (count ([getPos _x, 600] call I_fnc_findPlayers) >= 1)) then {
			for "_i" from 0 to 2 do {
				[([(getPos _x), (50 + random 50), (300 + random 100), 7, 0, 0.5, 0, [], []] call BIS_fnc_findSafePos)] params ["_scan"];
				
				if !(_scan isEqualTo (getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition"))) then {
					_group = [selectRandom I_DEF_LAND_INF_GROUPS, [_scan select 0, _scan select 1]] call I_fnc_createGroup;
					[_group, (getPos _x), 400, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
					
					{
						_objects pushBack _x;
					} forEach (units _group);
				};
			};
			
			[format ["ADS_TASK_%1", _x], [true, _objects, false]] call I_fnc_setVariable;
			diag_log format ["ADS_TASK_%1: Active", _x];
		};
		
		if (alive _x and ((_var select 0) isEqualTo true) and ((_var select 2) isEqualTo false) and (count ([getPos _x, 600] call I_fnc_findPlayers) <= 0)) then {
			[format ["ADS_TASK_%1", _x], [false, (_var select 1), false]] call I_fnc_setVariable;
			diag_log format ["ADS_TASK_%1: Inactive", _x];
			
			{
					deleteVehicle _x;
			} forEach (_var select 1);
		};
	
		if (!(alive _x) and (_var select 2) isEqualTo false) then {
			[format ["ADS_TASK_%1", (_this select 0)], [(_this select 1) select 0, (_this select 1) select 1, true]] call I_fnc_setVariable;
		};
	} forEach (_this select 0 select 0);
}, 5, [_array]] call CBA_fnc_addPerFrameHandler;