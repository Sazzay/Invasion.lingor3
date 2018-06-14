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

diag_log "test";

[_this select 0, objNull, []] params ["_obj", "_rally", "_respawn"];

if (isNil "_obj") exitWith {
	diag_log "I_fnc_createRallyPoint: _obj nil, invalid.";
};

[((group _obj) getVariable "I_GROUP_RALLYPOINT"), (nearestObjects [_obj, ["Man"], 50]), false] params ["_var", "_objects", "_fail"];

{
	if ((side _x) isEqualTo east) exitWith {
		_fail = true;
	};
} forEach _objects;

if (_fail isEqualTo true) exitWith {
	["Enemies nearby, can not drop rally."] call I_fnc_notification;
};

_rally = createVehicle ["Misc_Backpackheap", (_obj modelToWorld [0, 2, 0]), [], 0, "CAN_COLLIDE"];

if !(isNil "_var") then {
	(_var select 0) call BIS_fnc_removeRespawnPosition;
	deleteVehicle (_var select 1);
};

_respawn = [(group _obj), (getPos _rally), "RP"] call BIS_fnc_addRespawnPosition;
(group _obj) setVariable ["I_GROUP_RALLYPOINT", [_respawn, _rally]];

["Rally point dropped."] call I_fnc_notification;