/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Restrict the skill of an AI to a set of pre-defined parameters.
	
	Parameters:
	_this select 0: UNIT or GROUP
	
	Returns:
	
	Example:
	_call = [] call I_fnc_aiSkill;
*/

[_this select 0, []] params ["_mvar", "_table"];

if (!((typeName _mvar) isEqualTo "OBJECT") and !((typeName _mvar) isEqualTo "GROUP")) exitWith {
	diag_log "I_fnc_aiSkill: typeName returns something other than object or group, invalid."
};

_table = [
["spotTime", 0.7],
["spotDistance", 0.55],
["courage", 0.8],
["aimingSpeed", 0.2],
["aimingShake", 0.3],
["aimingAccuracy", 0.15],
["commanding", 0.6],
["reloadSpeed", 0.8]
];

if ((typeName _mvar) isEqualTo "OBJECT") then {
	{
		_mvar setSkill _x;
	} forEach _table;
};

if ((typeName _mvar) isEqualTo "GROUP") then {
	{
		_unit = _x;
		{
			_unit setSkill _x;
		} forEach _table;
	} forEach (units _mvar);
};