/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every 5 seconds the perFrameHandler checks if every town centre on the map has hostiles close to it, and if so it spawns
	in several units which are defined in the populateTown function. Messing with ADS_TOWN_[X, Y] can give odd results, so
	avoid at all costs.
*/

[[] call I_fnc_findTowns] params ["_towns"];

{
	[format ["ADS_TOWN_%1", [_x select 0, _x select 1]], [false, [], 0, false]] call I_fnc_setVariable;
} forEach _towns;

[{
	[_this select 0 select 0, []] params ["_pos", "_array"];

	{
		[(missionNamespace getVariable format ["ADS_TOWN_%1", [_x select 0, _x select 1]])] params ["_var"];
	
		if (count ([_x, 1200] call I_fnc_findPlayers) >= 1) then {
			_array set [_forEachIndex, [[_x select 0, _x select 1], true]];
		} else {
			_array set [_forEachIndex, [[_x select 0, _x select 1], false]];
		};
		
		if ((count ([_x, 100] call I_fnc_findPlayers) >= 1) and (_var select 2) < 100) then {
			[format ["ADS_TOWN_%1", [_x select 0, _x select 1]], [(_var select 0), (_var select 1), (_var select 2) + 10, false]] call I_fnc_setVariable;
		};
	} forEach _pos;
	
	{
		[(missionNamespace getVariable format ["ADS_TOWN_%1", (_x select 0)])] params ["_var"];
	
		if ((_var select 2) < 100) then {
			if (((_x select 1) isEqualTo true) and ((_var select 0) isEqualTo false)) then {
				[format ["ADS_TOWN_%1", (_x select 0)], [true, ([(_x select 0)] call I_fnc_populateTown), _var select 2, false]] call I_fnc_setVariable;
				diag_log format ["ADS_TOWN_%1: Active", (_x select 0)];
			};
			if (((_x select 1) isEqualTo false) and ((_var select 0) isEqualTo true)) then {
				[format ["ADS_TOWN_%1", (_x select 0)], [false, (_var select 1), (_var select 2), false]] call I_fnc_setVariable;
				diag_log format ["ADS_TOWN_%1: Inactive", (_x select 0)];
				{
					deleteVehicle _x;
				} forEach (_var select 1);
			};
		} else {
			if ((_var select 3) isEqualTo false) then {
				[_var, (_x select 0)] spawn {
					[format ["ADS_TOWN_%1", (_this select 1)], [((_this select 0) select 0), ((_this select 0) select 1), ((_this select 0) select 2), true]] call I_fnc_setVariable;
				
					sleep 600;
					
					{
						deleteVehicle _x;
					} forEach ((_this select 0) select 1);
					
					[format ["ADS_TOWN_%1", (_this select 1)], [((_this select 0) select 0), [], ((_this select 0) select 2), true]] call I_fnc_setVariable;
				};
			};
		};
	} forEach _array;
	
}, 5, [_towns]] call CBA_fnc_addPerFrameHandler;
