/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Takes an object, searches a radius for certain objects and then returns an array of positions infront (dir between -30
	and +30) of the relative position input.
	
	Parameters:
	_this select 0: OBJECT
	
	Returns:
	ARRAY
	
	Example:
	_call = [[1337, 1337]] call I_fnc_findAmbushLocation;
*/

[_this select 0, []] params ["_object", "_return"];

if (isNil "_object") exitWith {
	diag_log "I_fnc_findAmbushLocation: no position input specified."
};

{
	if ((([_object, _x] call BIS_fnc_dirTo) < ((getDir _object) + 30)) and (([_object, _x] call BIS_fnc_dirTo) > ((getDir _object) - 30))) then {
		if !(([(getPos _x), 30, 1, 6] call I_fnc_findNearestWater) isEqualTo []) then {
			_return pushBack (getPos _x);
		};
	};
} forEach (nearestTerrainObjects [getPos _object, ["TREE", "SMALL TREE", "FOREST BORDER"], 1000, true, true]);

_return