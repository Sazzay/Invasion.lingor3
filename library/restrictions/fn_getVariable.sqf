/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Checks whetever or not a public variable exists and then returns it if it does, otherwise it returns a default specified
	value.
	
	Parameters:
	_this select 0: STRING
	_this select 1: ANY
	
	Returns:
	ANY
	
	Example:
	_call = ["ADS_TASK_RRS", []] call I_fnc_getVariable;
*/

if !((typeName (_this select 0)) isEqualTo "STRING") exitWith { 
	diag_log "I_fnc_getVariable: _this select 0 invalid."
};

[(missionNamespace getVariable (_this select 0)), _this select 1, nil] params ["_var", "_default", "_return"];

if (isNil "_var") then {
	_return = _default;
} else {
	_return = _var;
}; 

_return