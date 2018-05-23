/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Creates a variable tied to the missionNamespace and then sets that variable to true for a set duration, and then goes false again.
	
	Parameters:
	_this select 0: STRING
	_this select 1: INT
	
	Returns:
	
	Example:
	_call = ["RESTRICT_MY_SPAWN", 600] call I_fnc_timedBool;
*/

[_this select 0, _this select 1] params ["_pvar", "_delay"];

if (isNil ("_pvar") or isNil ("_delay")) exitWith {
	diag_log "I_fnc_timedBool: missing data.";
};

missionNamespace setVariable [_pvar, true];

[_pvar, _delay] spawn {
	sleep (_this select 1);

	missionNamespace setVariable [_this select 0, false];
};