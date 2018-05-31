/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Searches a few viable locations around a town and spawns in some objects to fortify the positions, accordingly, it also
	spawns units in. Returns an array of objects.
	
	Parameters:
	_this select 0: Position2D
	
	Returns:
	ARRAY
	
	Example:
	_call = [[5000, 3000]] call I_fnc_populateTown;
*/

[_this select 0, [], [], [], []] params ["_pos", "_positions", "_objects", "_static", "_return"];

if ((count ([_pos, 400] call I_fnc_findEmptyNoRoads)) >= 1) then {
	_static pushBack ((selectRandom I_DEF_MILITARY_HQ_BUILDINGS) createVehicle ([_pos, ([_pos, 400] call I_fnc_findEmptyNoRoads)] call I_fnc_findNearestPos));
};

if ((count ([_pos, 400] call I_fnc_findEmptyNoRoads)) >= 4) then {
	for "_i" from 0 to 1 do {
		// Create some stuff
		_temp = (selectRandom I_DEF_MILITARY_VEHICLE_COVERS) createVehicle ([_pos, ([_pos, 400] call I_fnc_findEmptyNoRoads)] call I_fnc_findNearestPos);
		_temp setDir (getDir (nearestBuilding _temp));
		_veh = [(getPos _temp), (getDir _temp) - 180, selectRandom I_DEF_VEHICLES_ARMORED, EAST] call bis_fnc_spawnvehicle;
		// Sort into arrays
		_static pushBack _temp;
		_objects pushBack (_veh select 0);
		{
			_objects pushBack _x;
		} forEach (_veh select 1);
	};
};

if ((count ([_pos, 400] call I_fnc_findEmptyNoRoads)) >= 7) then {
	for "_i" from 0 to 4 do {
		if ((nearestObjects [([_pos, ([_pos, 400] call I_fnc_findEmptyNoRoads)] call I_fnc_findFarthestPos), ["Building"], 100]) isEqualTo []) then {
		_temp = (selectRandom I_DEF_MILITARY_WATCHTOWERS) createVehicle ([_pos, ([_pos, 400] call I_fnc_findEmptyNoRoads)] call I_fnc_findFarthestPos);
		_temp setDir (getDir (nearestBuilding _temp));
		_static pushBack _temp;
		};
	};
};

if ((count _static) > 0) then { // 37
	{
		[_x] params ["_building"];
	
		if !(([_x] call BIS_fnc_buildingPositions) isEqualTo []) then {
			[createGroup [east, true], nil] params ["_group", "_unit"];
		
			{
				if ((random 100) < 80) then {
					_unit = (_group createUnit [(selectRandom I_DEF_UNITS_GUARDS), _x, [], 0, "CAN_COLLIDE"]);
					_unit setDir (([_unit, (getPos _building)] call BIS_fnc_dirTo) - 180);
					_unit disableAI "MOVE";
					_objects pushBack _unit;
					
					[_unit] spawn {
						waitUntil {!((_this select 0) findNearestEnemy (getPos (_this select 0)) isEqualTo objNull)};
						(_this select 0) enableAI "MOVE";
					};
				};
			} forEach ([_x] call BIS_fnc_buildingPositions);
		};
	} forEach _static;
};

for "_i" from 0 to 5 do {
	[random 100, [], grpNull] params ["_random", "_scan", "_group"];

	if (_i isEqualTo 0 or _i isEqualTo 1) then {
		_random = 0;
	} else {
		_random = random 100;
	};
	
	if (_random < 40) then {	
		_scan = _pos findEmptyPosition [random 100, (200 + random 200), "Land_HelipadEmpty_F"];
		
		if !(_scan isEqualTo []) then {
			_group = [selectRandom ["VDV-INFANTRY-SQUAD", "MSV-INFANTRY-SQUAD"], [_scan select 0, _scan select 1]] call I_fnc_createGroup;
			[_group, _pos, 400] call CBA_fnc_taskPatrol;
			
			{
				_objects pushBack _x;
			} forEach (units _group);
		};
	};
};

_return = _objects + _static;

_return