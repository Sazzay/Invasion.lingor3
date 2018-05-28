/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Creates a variable tied to the missionNamespace with the specified name, and then sets it to the specified bool.
	
	Parameters:
	_this select 0: STRING
	_this select 1: BOOL
	
	Returns:
	
	Example:
	_call = ["RESTRICT_MY_SPAWN", true] call I_fnc_staticBool;
*/

[_this select 0, _this select 1] params ["_pvar", "_value"];

if (isNil ("_pvar") or isNil ("_value")) exitWith {
	diag_log "I_fnc_staticBool: missing data.";
};

missionNamespace setVariable [_pvar, _value];