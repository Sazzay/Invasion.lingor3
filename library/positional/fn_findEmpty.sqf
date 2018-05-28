/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Checks each map grid, and selects an empty position that is not a road.
	
	Parameters:
	
	Returns:
	
	Example:
	_call = [] call I_fnc_findEmpty;
*/

[] params [];

for "_i" from 50 to 10240 step 10 do {
	for "_i2" from 50 to 10240 step 10 do {
		
		if !(([_i,_i2,0] isFlatEmpty[50,-1,0.1,10,0,false,objNull]) isEqualTo [] && (isOnRoad[_i,_i2,0]) isEqualTo true) then 
		{
			_return pushBack [_i,_i2];
		};
	};
};

_return
