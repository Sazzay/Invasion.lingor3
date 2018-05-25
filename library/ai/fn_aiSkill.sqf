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
["ai_spotTime", 0.7],
["ai_spotDistance", 0.3],
["ai_courage", 0.8],
["ai_aimingSpeed", 0.2],
["ai_aimingShake", 0.3],
["ai_aimingAccuracy", 0.1],
["ai_commanding", 0.6],
["ai_reloadSpeed", 0.8],
["ai_ForcePosUp", true]
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
	} forEach _mvar;
};