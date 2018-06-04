/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Takes a position and finds a suitable position and then finds the farthest position away from specified position out of
	the positions found.
	
	Parameters:
	_this select 0: Position2D
	
	Returns:
	Position2D
	
	Example:
	_call = [[5000, 3000]] call I_fnc_findArtilleryPos;
*/

[_this select 0, [], []] params ["_pos", "_array", "_return"];

if (isNil "_pos") exitWith {
	diag_log "I_fnc_findArtilleryPos: _pos not defined.";
};

for "_i" from ((_pos select 0) - 4000) to ((_pos select 0) + 4000) step 40 do {
	for "_i2" from ((_pos select 1) - 4000) to ((_pos select 1) + 4000) step 40 do {
		if !(([_i, _i2] isFlatEmpty [40, -1, 0.5, 20, 0, false, objNull]) isEqualTo []) then {
			_array pushBack [_i, _i2];
		};
	};
};

_return = [_pos, _array] call I_fnc_findFarthestPos;

_return