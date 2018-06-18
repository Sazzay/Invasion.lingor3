player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	
	[_unit, _role] call I_fnc_vehicularEligibility;
}];

// Definitions
[] call compile preprocessFileLineNumbers "definitions\def_clientClasses.sqf";

// Client runtime
[] execVM "runtime\visual\rt_clientSettings.sqf";
[] execVM "runtime\visual\rt_clientTownHUD.sqf";
[] execVM "runtime\visual\rt_clientTaskHandler.sqf";
[] execVM "runtime\visual\rt_clientCreateDiary.sqf";
[] execVM "runtime\logistics\rt_clientLoadoutSpawn.sqf";
[] execVM "runtime\logistics\rt_clientRallyPoint.sqf";
[] execVM "runtime\logistics\rt_clientSetRole.sqf";