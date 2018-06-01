/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Finds all airports. Specific to lingor.
	
	Parameters:
	
	Returns:
	ARRAY
	
	Example:
	_call = [] call I_fnc_findAirports;
*/

[[], (getnumber (configfile >> "CfgWorlds" >> worldName >> "mapSize"))] params ["_return", "_size"];

{
	if !((text _x) in I_DEF_LOCATIONS_AIRPORTS) then {
		_return pushBack (locationPosition _x);
	};
} forEach (nearestLocations [[_size / 2, _size / 2], ["NameLocal"], _size]);

_return