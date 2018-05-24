/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Checks if an air vehicle is above a certain height and moving faster then a certain speed.
	
	Parameters:
	_this select 0: INT
	_this select 1: INT
	
	Returns:
	OBJECT
	
	Example:
	_call = [50, 200] call I_fnc_findHostileAir;
*/

[_this select 0, _this select 1, []] params ["_speed", "_height", "_return"];

if (isNil "_speed" or isNil "_height") exitWith {
	diag_log "I_fnc_findHostileBoatPatrol: height or speed not defined.";
};

{
	if (((speed _x) > _speed) and ((getTerrainHeightASL _x) > _height))  then {
		if (_x isKindOf "Air") then {
			_return pushBack _x;
		};
	};
} forEach vehicles;