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

			{
				for "_i" from 1 to 4 do {	
					
						_unit addItemToBackpack _x;
				};
			}forEach ["SmokeShell","SmokeShellRed","SmokeShellBlue"];
		};
	};
	
	if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {

		{
			_unit addItemToUniform _x;
		} forEach ["ACE_EarPlugs","ACE_IR_Strobe_Item","ACE_Flashlight_XL50","ACE_MapTools","ACE_microDAGR"];

		{
			for "_i" from 1 to 4 do {	
					
				_unit addItemToUniform _x;
			};
		}forEach ["ACE_fieldDressing","ACE_morphine"];

		if ((typeOf _unit) in I_USMC_CLASS_MEDIC) then {

			// add PAK and surgical kit.
			{
				_unit addItemToBackpack _x;
			}forEach ["ACE_personalAidKit","ACE_surgicalKit"];

			// add different bandage types.
			{
				for "_i" from 1 to 16 do {	
						
					_unit addItemToBackpack _x;
				};
			}forEach ["ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot"];

			// add morphine, epine and atropine.
			{
				for "_i" from 1 to 12 do {	
						
					_unit addItemToBackpack _x;
				};
			}forEach ["ACE_morphine","ACE_epinephrine","ACE_atropine"];

			// add blood, saline and plasma.
			{
				for "_i" from 1 to 2 do {	
						
					_unit addItemToBackpack _x;
				};
			}forEach ["ACE_bloodIV_250","ACE_salineIV_250","ACE_plasmaIV_250"];
		};

		if ((typeOf _unit) in I_USMC_CLASS_EOD) then {

			// add defusual kit and a m57 trigger.
			{
				_unit addItemToBackpack _x;
			}forEach ["ACE_DefusalKit","ACE_Clacker"];
		};
		
	} else {

		{
			for "_i" from 1 to 2 do {	
					
				_unit addItemToUniform _x;
			};
		}forEach ["FirstAidKit"];

		if ((typeOf _unit) in I_USMC_CLASS_MEDIC) then {

			{
				for "_i" from 1 to 12 do {	
					
					_unit addItemToBackpack _x;
				};
			}forEach ["FirstAidKit"];
		};
	};
}];
