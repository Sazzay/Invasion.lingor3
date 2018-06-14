/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Saves the default loadout of the unit, and it proceeds to give them that same loadout on respawn.
*/

player setVariable ["I_LOADOUT", (getUnitLoadout player)];

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	[(_unit getVariable ["I_LOADOUT", []]), ["rhsusf_socom_marsoc_teamleader", "rhsusf_socom_marsoc_spotter", "rhsusf_usmc_marpat_wd_teamleader"]] params ["_loadout", "_tls"];
	
	if !(_loadout isEqualTo []) then {
		_unit setUnitLoadout _loadout;
	};
	
	if (((["task_force_radio"] call I_fnc_isAddonActive) isEqualTo true) and ((typeOf _unit) in _tls)) then {
		_unit addBackpack "tf_rt1523g_rhs";
	};
	
	if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
	
		{
			_unit addItemToUniform _x;
		}forEach ["ACE_EarPlugs","ACE_IR_Strobe_Item","ACE_Flashlight_XL50","ACE_MapTools","ACE_microDAGR"];
	};
}];
