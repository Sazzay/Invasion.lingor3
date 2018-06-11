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

[_this select 0, _this select 1, objNull] params ["_group", "_pos", "_vehicle"];

if ((isNil "_group") or (isNil "_pos")) exitWith {
	diag_log "I_fnc_taskGroup: _pos, _group or _type not defined."
};

{
	if !((vehicle _x) isEqualTo _x) exitWith {
		_vehicle = (vehicle _x);
	};
} forEach (units _group);

if !(_vehicle isEqualTo objNull) then {
	{
		if !((typeOf _x) in I_DEF_UNITS_CREW) then {
			_x moveInAny _vehicle;
		};
	} forEach (units _group);
};

_group move _pos;

[_group, _pos, _vehicle] spawn {
	waitUntil {((leader(_this select 0)) distance (_this select 1)) < 200};
	
	if !((_this select 2) isEqualTo objNull) then {
		{
			if !((typeOf _x) in I_DEF_UNITS_CREW) then {
				unassignVehicle _x;
			};
		} forEach (units (_this select 0));
	};

	(_this select 0) setBehaviour "AWARE";
	(_this select 0) addWaypoint [(_this select 1), 10 + random 20];
	[(_this select 0), 0] setWaypointType "SAD";
	[(_this select 0), 0] setWaypointBehaviour "COMBAT";
};