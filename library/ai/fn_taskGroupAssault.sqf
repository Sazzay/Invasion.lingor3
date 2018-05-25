/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Takes a group and assigns it to assault the specified position.
	
	Parameters:
	_this select 0: GROUP
	_this select 1: Position2D
	
	Returns:
	
	Example:
	_call = [_group, [5000, 3000]] call I_fnc_taskGroupAssault;
*/

[_this select 0, _this select 1] params ["_group", "_pos"];

if ((isNil "_group") or (isNil "_pos")) exitWith {
	diag_log "I_fnc_taskGroup: _pos, _group or _type not defined."
};

_group addWaypoint [_pos, 10 + random 20];
[_group, 0] setWaypointType "SAD";

[_group, _pos] spawn {
	waitUntil {((leader(_this select 0)) distance (_this select 1)) < 200};

	[(_this select 0), 0] setWaypointBehaviour "COMBAT";
};