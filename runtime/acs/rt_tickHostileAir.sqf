/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every base -- seconds (modifiers to be added) this runtime script checks if there is a air vehicle and reacts accordingly
	depending on its class (plane or helicopter) with a little bit of randomization to it.
*/

["RESTRICT_ACS_AIR", 0] call I_fnc_timedBool; // Initialize the bool

while {true} do {
	_array = ([150, 50] call I_fnc_findHostileAir);

	if (!(_array isEqualTo []) and ((missionNamespace getVariable "RESTRICT_ACS_AIR") isEqualTo false) and ((random 100) < 30)) then {
		{
			if !(surfaceIsWater (getPos _x)) then {
				_group = [selectRandom ["VDV-AA-SQUAD", "VDV-AA-SQUAD-2"], selectRandom ([(getPos _x)] call I_fnc_findAAPos)] call I_fnc_createGroup;
				_group reveal [_x, (0.5 + random 1)];
				
				[_group] call I_fnc_deleteInactive;
				["RESTRICT_ACS_AIR", 600 - (random 300) + (random 300)] call I_fnc_timedBool;
				
				// Temp
				_markerstr = createMarker [format ["markername_%1", random 3500], getPos (leader _group)];
				_markerstr setMarkerShape "ICON";
				_markerstr setMarkerType "hd_dot";
			};
		} forEach _array;
	};

	sleep 30; // add mods to this, like radar sites would decrease the checks
};