/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Takes a position and finds a suitable position to spawn AA
	
	Parameters:
	_this select 0: Position2D
	
	Returns:
	ARRAY
	
	Example:
	_call = [[5000, 3000]] call I_fnc_findAAPos;
*/

[_this select 0, []] params ["_pos", "_return"];

if (isNil "_pos") exitWith {
	diag_log "I_fnc_findAAPos: _pos not defined."
};

for "_i" from ((_pos select 0) - 1000) to ((_pos select 0) + 1000) step 10 do {
	for "_i2" from ((_pos select 1) - 1000) to ((_pos select 1) + 1000) step 10 do {
		if !(([_i, _i2] isFlatEmpty [10, -1, 0.1, 10, 0, false, objNull]) isEqualTo []) then {
			_return pushBack [_i, _i2];
		};
	};
};

_return