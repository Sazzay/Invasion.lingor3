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
	};
}];