/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Cleans up vehicles stuck underwater.
*/

while {true} do {
	{
		if (((getPosASL _x) < 20) and ((crew _x) isEqualTo []) and ((typeOf _x) in I_DEF_BLUFOR_VEHICLES)) then {
			deleteVehicle _x;
		};
	} forEach vehicles;
	
	sleep 20;
};