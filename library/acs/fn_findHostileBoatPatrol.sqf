/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Checks if a boat is currently occupied by the specified amount of units and if it is in a river, and then returns 
	the position of that boat and it's direction.
	
	Parameters:
	_this select 0: INT
	
	Returns:
	ARRAY
	
	Example:
	_call = [5] call I_fnc_findHostileBoatPatrol;
*/

[_this select 0, []] params ["_amount", "_return"];

if (isNil "_amount") exitWith {
	diag_log "I_fnc_findHostileBoatPatrol: no amount specified.";
};

{
	if (_x isKindOf "Ship") then {
		if (abs(getTerrainHeightASL getPos _x) < 6) then {
			if (count (nearestObjects [_x, ["Man"], 20]) >= _amount) then {
				_return pushBack _x;
			};
		};
	};
} forEach vehicles;

hint str _return;