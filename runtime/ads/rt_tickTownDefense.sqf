/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every 5 seconds the perFrameHandler checks if every town centre on the map has hostiles close to it, and if so it spawns
	in several units which are defined in the populateTown function. Messing with ADS_TOWN_[X, Y] can give odd results, so
	avoid at all costs. WIP REWRITING!!!!
*/

[[] call I_fnc_findTowns] params ["_towns"];
// [is town active, is town captured, cap progress, despawn timeout] ARRAY DESCRIPTION OF ADS TOWN AS SEEN BELOW
{
	[format ["ADS_TOWN_%1", [_x select 0, _x select 1]], [false, false, 0, 0]] call I_fnc_setVariable;
	[format ["ADS_TOWN_%1_OBJECTS", [_x select 0, _x select 1]], []] call I_fnc_setVariable;
	GLOBAL setVariable [format ["ADS_TOWN_%1_CAP", [_x select 0, _x select 1]], 0, true];
	
	// experimental change
	[{
		[[_this select 0 select 0, _this select 0 select 1]] params ["_pos"];
		
		[(missionNamespace getVariable format ["ADS_TOWN_%1", _pos]), (missionNamespace getVariable format ["ADS_TOWN_%1_OBJECTS", _pos]), ([_pos, 50] call I_fnc_findPlayers)] params ["_var", "_objects", "_players"];
	
		if ((_var select 1) isEqualTo false and ((_var select 2) < 21)) then {
			if (count ([_pos, 600] call I_fnc_findPlayers) >= 1) then {
			hint str _objects;
			
				if ((_var select 0) isEqualTo false) then {
					[_pos] spawn I_fnc_populateTown;
					[format ["ADS_TOWN_%1", _pos], [true, (_var select 1), (_var select 2), (_var select 3)]] call I_fnc_setVariable;
					diag_log format ["ADS_TOWN_%1: Active", _pos];
				} else {
					if ((_var select 3) > 0) then {
						[format ["ADS_TOWN_%1", _pos], [(_var select 0), (_var select 1), (_var select 2), 0]] call I_fnc_setVariable; // reset back to 0 if a player is found inside radius again
					};
				};
			} else {
				if ((_var select 0) isEqualTo true) then {
					[format ["ADS_TOWN_%1", _pos], [(_var select 0), (_var select 1), (_var select 2), (_var select 3) + 1]] call I_fnc_setVariable;
					diag_log format ["ADS_TOWN_%1: Inactive, despawning: %2", _pos, (_var select 3) + 1];
				};
			};
			
			if ((_var select 3) >= 30) then {
				[format ["ADS_TOWN_%1", _pos], [false, (_var select 1), (_var select 2), (_var select 3)]] call I_fnc_setVariable;
				
				{
					deleteVehicle _x;
				} forEach _objects;
				
				diag_log format ["ADS_TOWN_%1: Despawned", _pos];
			};
			
			// cap
			if (count _players >= 1) then {
				[format ["ADS_TOWN_%1", _pos], [((missionNamespace getVariable format ["ADS_TOWN_%1", _pos]) select 0), (_var select 1), (_var select 2) + 0.25 + ((count _players) / 10), (_var select 3)]] call I_fnc_setVariable;
			};
			
			if ((count _players) isEqualTo 0 and (_var select 2) >= 0.25) then {
				if (((_var select 2) - 0.25) < 0) then {
					[format ["ADS_TOWN_%1", _pos], [((missionNamespace getVariable format ["ADS_TOWN_%1", _pos]) select 0), (_var select 1), 0, (_var select 3)]] call I_fnc_setVariable;
				} else {
					[format ["ADS_TOWN_%1", _pos], [((missionNamespace getVariable format ["ADS_TOWN_%1", _pos]) select 0), (_var select 1), (_var select 2) - 0.25, (_var select 3)]] call I_fnc_setVariable;
				};
			};
			
			GLOBAL setVariable [format ["ADS_TOWN_%1_CAP", _pos], ((missionNamespace getVariable format ["ADS_TOWN_%1", _pos]) select 2), true];
		};
		
		if ((_var select 1) isEqualTo false and ((_var select 2) >= 21)) then {
			[format ["ADS_TOWN_%1", _pos], [(_var select 1), true, (_var select 2), (_var select 3)]] call I_fnc_setVariable;
			
			[_objects] spawn {
				sleep 10;
			
				{
					if (_x isKindOf "Static") then {
						deleteVehicle _x;
					};
				} forEach (_this select 0);
			};
		};
	}, 5, [_x select 0, _x select 1]] call CBA_fnc_addPerFrameHandler;
} forEach _towns;