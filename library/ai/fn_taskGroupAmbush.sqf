/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Takes a group and assigns it to destroy the specified vehicle when it is close enough.
	
	Parameters:
	_this select 0: GROUP
	_this select 1: OBJECT
	
	Returns:
	
	Example:
	_call = [_group, _vehicle] call I_fnc_taskGroupDestroy;
*/

[_this select 0, _this select 1] params ["_group", "_vehicle"];

[_group, _vehicle] spawn {

{
	_x disableAI "AUTOTARGET";
} forEach (units (_this select 0));

waitUntil {((leader (_this select 0)) distance (_this select 1)) < 150};

(_this select 0) reveal (_this select 1);
(_this select 0) addWaypoint [_this select 1), 0];
[(_this select 0), 0] setWaypointType "DESTROY";
};