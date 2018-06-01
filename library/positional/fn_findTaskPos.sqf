/*
	Author: Markus "Sazzay" Larsson & Panda
	
	Description:
	Checks each map grid, and selects an empty position that is not a road.
	
	Parameters:
	
	Returns:
	ARRAY
	
	Example:
	_call = [] call I_fnc_findTaskPos;
*/

[[], ([] call I_fnc_findAirports), false] params ["_return", "_airports", "_fail"];

for "_i" from 50 to worldSize step 25 do {
	for "_i2" from 50 to worldSize step 25 do {
		if (!(([_i, _i2, 0] isFlatEmpty [10,-1,0.2,10,0,false,objNull]) isEqualTo []) && (isOnRoad[_i, _i2, 0]) isEqualTo false) then {
			{ 
				if (_x distance [_i,_i2] < 800) exitWith {
					_fail = true;
				};
				
				_fail = false;
			} forEach _airports;
			
			if (_fail isEqualTo false) then {
				_return pushBack [_i,_i2];
			};
		};
	};
};

_return