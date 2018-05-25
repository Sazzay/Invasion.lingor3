/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Creates a group of preset units as per defined in definitions.
	
	Parameters:
	_this select 0: GROUP

	Returns:
	
	Example:
	_call = [_group1] call I_fnc_deleteInactive;
*/

[_this select 0] params ["_group"];

if (isNil "_group") exitWith {
	diag_log "I_fnc_deleteInactive: no group specified.";
};

[_group] spawn {
	while {true} do {
		sleep 1200;
		
		_exit = false;
		_fail = false;
		_array = nearestObjects [(leader (_this select 0)), ["Man", "Air", "LandVehicle"], 1000];
		
		{
			if (_x in _array) exitWith {
				_fail = true;
			};
		} forEach playableUnits;
						
		if ((((units (_this select 0)) select 0) findNearestEnemy ((units (_this select 0)) select 0) isEqualTo objNull) and (_fail isEqualTo false)) then {
			{
				deleteVehicle _x;
			} forEach (units (_this select 0));
							
			_exit = true;
		};
		
		if (_exit isEqualTo true) exitWith {
			hint "Units removed from inactivity."
		};
	};
};