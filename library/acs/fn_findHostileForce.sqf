/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Find a mass of grouped blufor units and return their position and direction correlation to the sea
	
	Parameters:
	_this select 0: INT
	
	Returns:
	ARRAY
	
	Example:
	_call = [] call I_fnc_findHostileForce;
*/

[_this select 0, [], false, [0, 0], [0, 0], 0, [], []] params ["_amount", "_array", "_pass", "_fPos", "_pos", "_dir", "_depth", "_return"];

if (isNil "_amount") exitWith {};

{
	if (position _x isFlatEmpty [-1, -1, -1, -1, 0, false] isEqualTo []) exitWith {};

	{
		if (side _x isEqualTo west) then {
			_array pushBack _x;
		};
	} forEach nearestObjects [_x, ["Man"], 30];
	
	if (count _array > _amount) exitWith {
		_pass = true;
	};
	
	_array = [];
} forEach allUnits;

if (_pass isEqualTo true) then {
	{
		_pos = getPos _x;
		
		for "_i" from 0 to 1 do {
			_fPos set [_i, (_fPos select _i) + (_pos select _i)];
		};
	} forEach _array;
	
	for "_i" from 0 to 1 do {
		_fPos set [_i, (_fPos select _i) / (count _array)];
	};
	
	_dir = [_fPos, ([_fPos, 5000, 10] call I_fnc_findNearestWater)] call BIS_fnc_dirTo;
};

_return = [_fPos, _dir];

_return