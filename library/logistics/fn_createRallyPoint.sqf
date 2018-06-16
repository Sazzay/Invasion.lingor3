/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Drops a rally point down, overriding the old one.
	
	Parameters:
	_this select 0: OBJECT
	
	Returns:
	
	Example:
	[_obj] call I_fnc_createRallyPoint;
*/

[_this select 0, objNull, []] params ["_obj", "_rally", "_respawn"];

if (isNil "_obj") exitWith {
	diag_log "I_fnc_createRallyPoint: _obj nil, invalid.";
};

if !((vehicle _obj) isEqualTo _obj) exitWith {["Rally point can not be placed from inside a vehicle."] call I_fnc_notification;}; // pls no grief
if (surfaceIsWater (getPos _obj)) exitWith {["Rally point can not be placed in water."] call I_fnc_notification;}; // pls no grief
if (((getPosATL _obj) select 2) > 10) exitWith {["Rally point can not be placed while airborne."] call I_fnc_notification;}; // pls no grief

[((group _obj) getVariable "I_GROUP_RALLYPOINT"), (nearestObjects [_obj, ["Man"], 50]), ((group _obj) getVariable "I_GROUP_RALLYPOINT_TIMEOUT"), false] params ["_var", "_objects", ["_timeout", 0], "_fail"];

if (_timeout > 0) exitWith {[format ["You are unable place another rally for %1 seconds.", _timeout]] call I_fnc_notification;};

{
	if ((side _x) isEqualTo east) exitWith {
		_fail = true;
	};
} forEach _objects;

if (_fail isEqualTo true) exitWith {["Enemies nearby, rally point can not be dropped."] call I_fnc_notification;};

if !(isNil "_var") then {
	(_var select 0) call BIS_fnc_removeRespawnPosition;
	deleteVehicle (_var select 1);
	deleteMarker (_var select 2);
};

_rally = createVehicle ["Misc_Backpackheap", (_obj modelToWorld [0, 2, 0]), [], 0, "CAN_COLLIDE"];
_respawn = [(group _obj), (getPos _rally), "RP"] call BIS_fnc_addRespawnPosition;
_marker = [format ["RP_%1", (group _obj)], (getPos _rally), "respawn_inf", "ColorWEST", format ["Rally Point - %1", groupId (group _obj)]] call I_fnc_createMarkerIcon;

(group _obj) setVariable ["I_GROUP_RALLYPOINT", [_respawn, _rally, _marker]];

[(group _obj)] spawn {
	(_this select 0) setVariable ["I_GROUP_RALLYPOINT_TIMEOUT", 240];

	while {((_this select 0) getVariable "I_GROUP_RALLYPOINT_TIMEOUT") > 0} do {
		(_this select 0) setVariable ["I_GROUP_RALLYPOINT_TIMEOUT", ((_this select 0) getVariable "I_GROUP_RALLYPOINT_TIMEOUT") - 1];
		uiSleep 1;
	};
};

["Rally point dropped."] call I_fnc_notification;