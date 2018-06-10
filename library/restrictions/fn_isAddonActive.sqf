/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Checks whetever or not the specified addon exists as per defined in CfgPatches.
	
	Parameters:
	_this select 0: STRING
	
	Returns:
	BOOL
	
	Example:
	_call = ["task_force_radio"] call I_fnc_isAddonActive;
*/

[_this select 0, nil] params ["_cfg", "_return"];

if (isNil "_cfg") exitWith {
	diag_log "I_fnc_isAddonActive: no CfgPatches defined.";
};

if (isClass (configFile >> "CfgPatches" >> _cfg)) then {
	_return = true;
} else {
	_return = false;
};

_return