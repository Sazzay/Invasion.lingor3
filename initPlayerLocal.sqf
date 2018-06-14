player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	
	[_unit, _role] call I_fnc_vehicularEligibility;
}];

// Client runtime
[] execVM "runtime\visual\rt_clientTownHUD.sqf";
[] execVM "runtime\visual\rt_clientTaskHandler.sqf";
[] execVM "runtime\visual\rt_clientCreateDiary.sqf";
[] execVM "runtime\logistics\rt_clientLoadoutSpawn.sqf";
[] execVM "runtime\logistics\rt_clientRallyPoint.sqf";