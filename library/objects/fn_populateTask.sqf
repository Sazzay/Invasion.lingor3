/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Takes an array of positions and creates a certain amount of objectives spread across the map. Returns an array of
	objects.
	
	Parameters:
	_this select 0: ARRAY
	
	Returns:
	ARRAY
	
	Example:
	_call = [[[5000, 3000], [5000, 3000]]] call I_fnc_populateTask;
*/

[_this select 0, []] params ["_array", "_return"];

if (isNil "_array") exitWith {
	diag_log "I_fnc_populateTask: _array invalid."
};

{
	[_x, true] params ["_pos", "_valid"];

	{
		[_x] params ["_object"];
	
		{
			if (_x isEqualTo (typeOf _object)) exitWith {
				_valid = false;
			};
		} forEach I_DEF_TASK_OBJECTS;
	} forEach (nearestObjects [_pos, ["LandVehicle", "Static"], 1500]);
	
	if (_valid isEqualTo true) then {
		_return pushBack (createVehicle [(selectRandom I_DEF_TASK_OBJECTS), _pos, [], 0, "CAN_COLLIDE"]);
	
		// debug - remove later
		_markerstr = createMarker [format ["markername%1", _forEachIndex], _pos];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "hd_dot";
	};
} forEach (_array call BIS_fnc_arrayShuffle);

_return