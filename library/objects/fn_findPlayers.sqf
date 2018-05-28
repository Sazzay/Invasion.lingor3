/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Finds players in a specified radius at the specified position and then returns those players (objects) in an array.
	
	Parameters:
	_this select 0: Position2D
	_this select 1: INT
	
	Returns:
	ARRAY
	
	Example:
	_call = [[5000, 3000], 300] call I_fnc_findPlayers;
*/

[_this select 0, _this select 1, []] params ["_pos", "_rad", "_return"];

if ((isNil "_pos") or (isNil "_rad")) then {
	diag_log "I_fnc_findPlayers: _pos or _rad not defined.";
};

{
	if ((isPlayer _x) and (alive _x)) then {
		_return pushBack _x;
	};
} forEach (nearestObjects [_pos, ["Man", "LandVehicle", "Ship", "Air"], _rad]);

_return