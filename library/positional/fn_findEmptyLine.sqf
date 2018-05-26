/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Takes a position, a min/max distance and searches for empty places in a radius in a line from the position in the specified
	direction.
	
	Parameters:
	_this select 0: Position2D
	_this select 1: INT
	_this select 2: INT
	_this select 3: INT
	_this select 4: INT
	
	Returns:
	ARRAY
	
	Example:
	_call = [[5277, 8081], 100, 1000, 240] call I_fnc_findEmptyLine;
*/


[_this select 0, _this select 1, _this select 2, _this select 3, false, []] params ["_pos", "_mind", "_maxd", "_dir", "_fail", "_return"];

{
	if ((isNil _x)) exitWith {
		diag_log format ["I_fnc_findEmptyLine: %1 not defined.", _x];
		_fail = true;
	};
} forEach ["_pos", "_mind", "_maxd", "_dir"];

if (_fail isEqualTo true) exitWith {};

for "_i" from _mind to _maxd step ((_maxd - _mind) / 25) do {
	_spos = ([[(_pos select 0) + (_i * sin _dir), (_pos select 1) + (_i * cos _dir)], 0, ((_maxd - _mind) / 25), 5, 0, 0.4, 0, [], []] call BIS_fnc_findSafePos);
	
	if !(_spos isEqualTo [4400, 4400, 300]) then {
		_return pushBack _spos;
	};
};

_return