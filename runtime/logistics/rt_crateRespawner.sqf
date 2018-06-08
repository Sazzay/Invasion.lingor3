/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Respawns crates whenever the old one has been away for too long.
*/

[[[6816.84,10087.7,46.663], [6818.21,10084.8,46.6631]], [objNull, objNull]] params ["_positions", "_objects"];

while {true} do {
	{
		[((_objects select _forEachIndex) getVariable "I_BOX_RESPAWN_COUNT")] params [["_var", 0]];
		
		hint str _var;
	
		if ((_objects select _forEachIndex) isEqualTo objNull) then {
			_objects set [_forEachIndex, ([_x] call I_fnc_createAmmoCrate)];
		} else {
			if !(alive (_objects select _forEachIndex)) then {
				_objects set [_forEachIndex, objNull];
			};
			
			if (((getPos (_objects select _forEachIndex)) distance _x) > 60) then {
				(_objects select _forEachIndex) setVariable ["I_BOX_RESPAWN_COUNT", _var + 1];
			} else {
				if (_var > 0) then {
					(_objects select _forEachIndex) setVariable ["I_BOX_RESPAWN_COUNT", _var - 1];
				};
			};
		};
		
		if (_var >= 5) then {
			[(_objects select _forEachIndex)] spawn {
				sleep 3600;
				
				deleteVehicle (_this select 0);
			};
			
			_objects set [_forEachIndex, objNull];
		};
	} forEach _positions;

	sleep 60;
};