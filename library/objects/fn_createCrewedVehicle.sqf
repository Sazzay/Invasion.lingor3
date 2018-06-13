/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Creates a vehicle either to the attached group or side (works as spawnVehicle).
	
	Parameters:
	_this select 0: STRING
	_this select 1: Position2D
	_this select 2: INT
	_this select 3: GROUP or SIDE
	
	Types:
	Can be found in definitions/groups.sqf
	
	Returns:
	GROUP
	
	Example:
	_call = ["rhs_bmp3_late_msv", [5000, 3000], 180, _group] call I_fnc_createCrewedVehicle;
*/

[_this select 0, _this select 1, _this select 2, _this select 3, grpNull, objNull, "NONE", nil] params ["_type", "_pos", "_dir", "_gs", "_group", "_veh", "_special", "_return"];

if ((isNil "_type") or (isNil "_pos") or (isNil "_dir") or (isNil "_gs")) exitWith {
	diag_log "I_fnc_createCrewedVehicle: _type, _pos, _dir or _gs invalid.";
};

if ((typeName _gs) isEqualTo "GROUP") then {
	_group = _gs;
	_special = "FORM";
};

if ((typeName _gs) isEqualTo "SIDE") then {
	_group = createGroup _gs;
};

if !(((typeName _gs) isEqualTo "GROUP") or (typeName _gs) isEqualTo "SIDE") exitWith {
	diag_log "I_fnc_createCrewedVehicle: _gs is not a GROUP or SIDE.";
};

_veh = createVehicle [_type, _pos, [], 0, _special];
_veh setDir _dir;
createVehicleCrew _veh;

_group deleteGroupWhenEmpty true;

_return = [_veh,_group];

_return