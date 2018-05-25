/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every base -- seconds (modifiers to be added) this runtime script checks if there is a air vehicle and reacts accordingly
	depending on its class (plane or helicopter) with a little bit of randomization to it.
*/

["RESTRICT_ACS_AIR", 0] call I_fnc_timedBool; // Initialize the bool

while {true} do {
	_array = ([20, 100] call I_fnc_findHostileAir);

	if (!(_array isEqualTo []) and ((missionNamespace getVariable "RESTRICT_ACS_AIR") isEqualTo false) and ((random 100) < 20)) then {
		{
			if !(surfaceIsWater (getPos _x)) then {
				_group = [selectRandom ["VDV-AA-SQUAD", "VDV-AA-SQUAD-2", "VDV-AA-URAL"], selectRandom ([(getPos _x)] call I_fnc_findAAPos)] call I_fnc_createGroup;
				_group reveal [_x, (0.5 + random 1)];
				
				[_group] call I_fnc_deleteInactive;
				
				// Temp
				_markerstr = createMarker [format ["markername_%1", random 3500], getPos (leader _group)];
				_markerstr setMarkerShape "ICON";
				_markerstr setMarkerType "hd_dot";
			} else {
				if (_x isKindOf "Plane") then {
					_arr = [[0, 0, 300], ([[0, 0], (getPos _x)] call BIS_fnc_dirTo), (selectRandom I_DEF_VEHICLES_PLANES), EAST] call bis_fnc_spawnvehicle;
					[(_arr select 2), (getPos _x)] call I_fnc_taskGroupAssault;
				};
			};
		} forEach _array;
		
		["RESTRICT_ACS_AIR", 600 - (random 150) + (random 150)] call I_fnc_timedBool;
	};

	sleep 20; // add mods to this, like radar sites would decrease the checks
};