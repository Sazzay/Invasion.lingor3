/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Saves the default loadout of the unit, and it proceeds to give them that same loadout on respawn.
*/

player setVariable ["I_LOADOUT", (getUnitLoadout player)];

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	[(_unit getVariable ["I_LOADOUT", []])] params ["_loadout"];
	
	if !(_loadout isEqualTo []) then {
		_unit setUnitLoadout _loadout;
		_unit linkItem "ItemGPS";
	};
	
	if (((["task_force_radio"] call I_fnc_isAddonActive) isEqualTo true)) then {

		_unit linkItem "tf_anprc152";

		if ((typeOf _unit) in I_USMC_CLASS_TFAR_LR) then {
			_unit addBackpack "tf_rt1523g_rhs";
		};
	};
	
	if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
		{
			_unit addItemToUniform _x;
		} forEach ["ACE_EarPlugs","ACE_IR_Strobe_Item","ACE_Flashlight_XL50","ACE_MapTools","ACE_microDAGR"];
	};
}];
