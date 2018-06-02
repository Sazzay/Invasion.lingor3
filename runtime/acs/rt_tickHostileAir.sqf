/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every base 15 seconds (modifiers to be added) this runtime script checks if there is a air vehicle and reacts accordingly
	depending on its class (plane or helicopter) with a little bit of randomization to it.
*/

[[], grpNull, nil] params ["_array", "_group", "_var"];

["RESTRICT_ACS_AIR", 0] call I_fnc_timedBool; // Initialize the bool

while {true} do {
	_array = ([0, 100] call I_fnc_findHostileAir);
	_var = (["ADS_TASK_RRS", [0, 0, 0]] call I_fnc_getVariable);

	if (!(_array isEqualTo []) and ((missionNamespace getVariable "RESTRICT_ACS_AIR") isEqualTo false) and ((random 100) < (30 + ((_var select 0) * 3)))) then {
		{
			if !(surfaceIsWater (getPos _x)) then {
				_group = [selectRandom ["VDV-AA-SQUAD", "VDV-AA-SQUAD-2", "VDV-AA-URAL"], selectRandom ([(getPos _x)] call I_fnc_findAAPos)] call I_fnc_createGroup;
				_group reveal [_x, (0.5 + random 1)];
				
				[_group] call I_fnc_deleteInactive;
			} else {
				if (_x isKindOf "Plane") then {
					_arr = [[0, 0, 300], ([[0, 0], (getPos _x)] call BIS_fnc_dirTo), (selectRandom I_DEF_VEHICLES_AA_PLANES), EAST] call bis_fnc_spawnvehicle;
					[(_arr select 2), (getPos _x)] call I_fnc_taskGroupAssault;
				};
			};
		} forEach _array;
		
		["RESTRICT_ACS_AIR", 600 - (random 150) + (random 150) - ((_var select 0) * 20)] call I_fnc_timedBool;
	};

	sleep 15;
};