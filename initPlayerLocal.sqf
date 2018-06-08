player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	
	//_call = [_unit, _role] call I_fnc_vehicularEligibility;
}];

// Client runtime
[] execVM "runtime\visual\rt_clientTownHUD.sqf";
[] execVM "runtime\visual\rt_clientTaskHandler.sqf";
[] execVM "runtime\logistics\rt_clientLoadoutSpawn.sqf";