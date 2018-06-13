/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Services the vehicle that was input.
	
	Parameters:
	_this select 0: OBJECT
	
	Returns:
	
	Example:
	_call = [_obj] call I_fnc_serviceVehicle;
*/

[_this select 0] params [["_object", objNull]];

if (_object isEqualTo objNull) exitWith {
	diag_log "I_fnc_serviceVehicle: no vehicle was provided.";
};

[_object] spawn {
	for "_i" from (damage (_this select 0)) to 0 step -0.01 do {
		(_this select 0) setDamage _i;
			
		sleep 0.1;
	};

	for "_i" from (fuel (_this select 0)) to 1 step 0.01 do {
		(_this select 0) setFuel _i;
			
		sleep 0.1;
	};

	
	[(_this select 0), 1] remoteExec ["setVehicleAmmo", (_this select 0), false];
};