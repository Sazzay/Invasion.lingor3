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

[_this select 0, [], []] params ["_pos", "_positions", "_objects"];


//hint str (count _positions);

if ((count ([_pos, 400] call I_fnc_findEmptyNoRoads)) >= 1) then {
	(selectRandom I_DEF_MILITARY_HQ_BUILDINGS) createVehicle ([_pos, ([_pos, 400] call I_fnc_findEmptyNoRoads)] call I_fnc_findNearestPos);
};

if ((count ([_pos, 400] call I_fnc_findEmptyNoRoads)) >= 3) then {
	hint "test";

	for "_i" from 0 to 1 do {
		_temp = (selectRandom I_DEF_MILITARY_VEHICLE_COVERS) createVehicle ([_pos, ([_pos, 400] call I_fnc_findEmptyNoRoads)] call I_fnc_findNearestPos);
		_temp setDir (getDir (nearestBuilding _temp));
		[(getPos _temp), (getDir _temp) - 180, selectRandom I_DEF_VEHICLES_ARMORED, EAST] call bis_fnc_spawnvehicle;
	};
};

if ((count ([_pos, 400] call I_fnc_findEmptyNoRoads)) >= 7) then {
	for "_i" from 0 to 4 do {
		if ((nearestObjects [([_pos, ([_pos, 400] call I_fnc_findEmptyNoRoads)] call I_fnc_findFarthestPos), ["Building"], 50]) isEqualTo []) then {
		_temp = (selectRandom I_DEF_MILITARY_WATCHTOWERS) createVehicle ([_pos, ([_pos, 400] call I_fnc_findEmptyNoRoads)] call I_fnc_findFarthestPos);
		_temp setDir (getDir (nearestBuilding _temp));
		_objects pushBack _temp;
		};
	};
};
