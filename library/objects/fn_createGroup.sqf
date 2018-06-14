/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Creates a group of preset units as per defined in definitions.
	
	Parameters:
	_this select 0: STRING
	_this select 1: Position2D
	
	Types:
	Can be found in definitions/groups.sqf
	
	Returns:
	GROUP
	
	Example:
	_call = ["MSV-BMP3M-SQUAD", [5000, 3000]] call I_fnc_createGroup;
*/

[_this select 0, _this select 1, nil] params ["_type", "_pos", "_index"];

if (isNil("_type") or isNil ("_pos")) exitWith {
	diag_log "I_fnc_createGroup: _type can not be nil.";
};

{
	if (_type in _x) exitWith {
		_index = _forEachIndex;
	};
} forEach I_DEF_OPFOR_INEFFICIENT_GROUPS;

_return = [_pos, EAST, ((I_DEF_OPFOR_INEFFICIENT_GROUPS select _index) select 1)] call BIS_fnc_spawnGroup;

[_return] call I_fnc_aiSkill;
_return deleteGroupWhenEmpty true;

_return