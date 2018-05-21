player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	
	_call = [_unit, _role] call I_fnc_vehicularEligibility;
}];