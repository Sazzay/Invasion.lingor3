/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Takes an array as per defined by FB_fnc_getCompData.
	
	Parameters:
	_this select 0: Position3D
	_this select 1: ARRAY
	
	Returns:
	
	Example:
	[[1337, 1337]] call I_fnc_spawnComposition;
*/

[_this select 0, _this select 1, []] params ["_pos", "_array", "_return"];

if ((isNil "_pos") or (isNil "_array")) exitWith {
	diag_log "I_fnc_spawnComposition: _pos or _array is nil, invalid.";
};

{
	[(createVehicle [(_x select 0), _pos vectorAdd (_x select 1), [], 0, "CAN_COLLIDE"])] params ["_veh"];
	_veh setDir (_x select 2);
	_return pushBack _veh;
} forEach _array;

_return