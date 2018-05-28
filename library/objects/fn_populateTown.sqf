/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Searches a few viable locations around a town and spawns in some objects to fortify the positions, accordingly, it also
	spawns units in. Returns an array of objects
	
	Parameters:
	_this select 0: Position2D
	
	Returns:
	ARRAY
	
	Example:
	_call = [[5000, 3000]] call I_fnc_populateTown;
*/

[_this select 0, [], nil] params ["_pos", "_positions", "_find"];

(selectRandom I_DEF_HQ_BUILDINGS) createVehicle (selectRandom ([_pos, 300] call I_fnc_findEmptyNoRoads));

for "_i" from 0 to (3 + random 5) do {
	_temporary = (selectRandom I_DEF_MILITARY_BUILDINGS) createVehicle (selectRandom ([_pos, 300] call I_fnc_findEmptyNoRoads));
	_temporary setDir (getDir (nearestBuilding _pos));
	
	if (typeOf _temporary isEqualTo "Land_CamoNetB_EAST") then {
		[(getPos _temporary), (getDir _temporary) - 180, selectRandom I_DEF_VEHICLES_ARMORED, EAST] call bis_fnc_spawnvehicle;
	};
};

// wip as fuck m8