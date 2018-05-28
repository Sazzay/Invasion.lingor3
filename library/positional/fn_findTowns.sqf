/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Finds all towns, cities and major cities on the map and returns the locations in an array.
	
	Parameters:
	
	Returns:
	ARRAY
	
	Example:
	_call = [] call I_fnc_findTowns;
*/

[[], (getnumber (configfile >> "CfgWorlds" >> worldName >> "mapSize"))] params ["_return", "_size"];

{
	_return pushBack (locationPosition _x);
} forEach (nearestLocations [[_size / 2, _size / 2], ["CityCenter"], _size]);

_return