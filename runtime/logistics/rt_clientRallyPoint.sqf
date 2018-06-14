/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Adds an addaction to create a rally point if the unit role is that of a teamleader as defined in units.sqf
*/

if ((typeOf player) in ["rhsusf_usmc_marpat_wd_teamleader", "rhsusf_socom_marsoc_teamleader", "rhsusf_socom_marsoc_sniper_m107"]) then {
	player addEventHandler ["Respawn", {
		player addAction ["<t color='#679eff'>Deploy Rallypoint</t>", I_fnc_createRallyPoint, nil, 6, false, false, "", "(vehicle _this) isEqualTo _target", -1, false, "", ""];
	}];
};
