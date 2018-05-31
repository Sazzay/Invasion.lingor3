/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Checks if an air vehicle is above a certain height and moving faster then a certain speed.
	
	Parameters:
	_this select 0: INT
	_this select 1: INT
	
	Returns:
	ARRAY
	
	Example:
	_call = [200, 50] call I_fnc_findHostileAir;
*/

[_this select 0, _this select 1, []] params ["_speed", "_height", "_return"];

if (isNil "_speed" or isNil "_height") exitWith {
	diag_log "I_fnc_findHostileBoatPatrol: height or speed not defined.";
};

{
	if (((speed _x) >= _speed) and (((getPosASL _x) select 2) >= _height))  then {
		if ((_x isKindOf "Air") and ((side _x) isEqualTo west)) then {
			_return pushBack _x;
		};
	};
} forEach vehicles;

_return