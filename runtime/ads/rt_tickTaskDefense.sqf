/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Initially spawns objectives through a couple of functions, then it checks if players are close to those objectives and if
	so it spawns in units to defend it.
*/


[([(call I_fnc_findTaskPos)] call I_fnc_populateTask)] params ["_array"];

{
	[format ["ADS_TASK_%1", (getPos _x)], [false, []]] call I_fnc_setVariable;
} forEach _array;

[{
	{
		[(missionNamespace getVariable format ["ADS_TASK_%1", (getPos _x)]), []] params ["_var", "_objects"];
	
		if (alive _x and ((_var select 0) isEqualTo false) and ((_var select 2) isEqualTo false) and (count ([_x, 400] call I_fnc_findPlayers) >= 1)) then {
			// spawn things here
			[format ["ADS_TASK_%1", (getPos _x)], [true, _objects, false]] call I_fnc_setVariable;
			hint format ["ADS_TASK_%1: Active", (getPos _x)];
		};
		
		if (((_var select 0) isEqualTo true) and ((_var select 2) isEqualTo false) and (count ([_x, 400] call I_fnc_findPlayers) <= 0)) then {
			[format ["ADS_TASK_%1", (getPos _x)], [false, _objects, false]] call I_fnc_setVariable;
			hint format ["ADS_TASK_%1: Inactive", (getPos _x)];
		};
	
		if !(alive _x) then {
			[_x, _var] spawn {
				[format ["ADS_TASK_%1", (getPos (_this select 0))], [(_this select 1) select 0, (_this select 1) select 1, true]] call I_fnc_setVariable;
			
				sleep 600;
				
				deleteVehicle (_this select 0);
				
				{
					deleteVehicle _x;
				} forEach (_this select 1);
			};
		}
	} forEach (_this select 0);
}, 5, [_array]] call CBA_fnc_addPerFrameHandler;