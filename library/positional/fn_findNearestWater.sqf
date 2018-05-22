/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Finds the nearest body of sea water.
	
	Parameters:
	_this select 0: Position2D
	_this select 1: INT
	
	Returns:
	Position2D
	
	Example:
	_call = [[12351, 2334], 3000] call I_fnc_findNearestWater;
*/

[_this select 0, _this select 1, [], []] params ["_pos", "_radius", "_positions", "_distances"];

if ((isNil ("_pos")) or (isNil ("_radius"))) exitWith {
	diag_log "I_fnc_findNearestWater: insufficient information provided."
};

for "_i" from ((_pos select 0) - _radius) to ((_pos select 0) + _radius) step 250 do {
	for "_i2" from ((_pos select 1) - _radius) to ((_pos select 1) + _radius) step 250 do {
		if (surfaceIsWater [_i, _i2]) then {
			_positions pushBack [_i, _i2, 0];
		};
	};
};
	
if !(_positions isEqualTo []) then {
	{
		_distances pushBack (_pos distance2D _x);
	} forEach _positions;	
};
	
_return = [(_positions select (_distances find (selectMin _distances))) select 0, (_positions select (_distances find (selectMin _distances))) select 1, 0];
	
hint str _return;
// 5291, 8988