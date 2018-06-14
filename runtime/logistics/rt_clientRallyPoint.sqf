/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Adds an addaction to create a rally point if the unit role is that of a teamleader as defined in units.sqf
*/

//player addAction ["Drop Rally Point", I_fnc_createRallyPoint, [player], 6, false, false, "", "true", -1, false, "", ""];

if ((typeOf player) in ["rhsusf_usmc_marpat_wd_teamleader", "rhsusf_socom_marsoc_teamleader", "rhsusf_socom_marsoc_sniper_m107"]) then {
	player addEventHandler ["Respawn", {
		player addAction ["Drop Rally Point", I_fnc_createRallyPoint, nil, 6, false, false, "", "(vehicle _this) isEqualTo _target", -1, false, "", ""];
	}];
};