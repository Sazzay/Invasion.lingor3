/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Checks whetever the specified amount of distance in a straight line is water or not. Returns true if water is found
	
	
	Parameters:
	_this select 0: Position2D
	_this select 1: INT
	_this select 2: INT
	
	Returns:
	BOOL
	
	Example:
	_call = [[12351, 2334], 30, 200] call I_fnc_findEmptyWaterLine;
*/

[_this select 0, _this select 1, _this select 2, true] params ["_pos", "_dir", "_distance", "_return"];

if ((isNil "_pos") or (isNil "_dir") or (isNil "_distance")) then {
	diag_log "I_fnc_findEmptyWaterLine: pos, dir or distance not specified.";
};

for "_i" from 0 to _distance step (_distance / 10) do {
	if !(surfaceIsWater [(_pos select 0) + (_i * sin _dir), (_pos select 1) + (_i * cos _dir)]) exitWith {
		_return = false;
	};
};

_return