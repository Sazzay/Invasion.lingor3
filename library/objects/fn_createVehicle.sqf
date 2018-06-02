/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	
	Parameters:
	_this select 0: STRING
	_this select 1: Position3D
	_this select 2: INT
	_this select 3: BOOL
	_this select 4: BOOL
	
	Returns:
	OBJECT
	
	Example:
	_call = [] call I_fnc_createVehicle;
*/

[objNull, _this select 0, _this select 1, _this select 2, _this select 3, _this select 4] params ["_vehicle","_type", "_pos", "_dir", "_respawn","_isMHQ"];

if (isNil "_type") exitWith {
	diag_log "I_fnc_createVehicle: invalid type.";
};

if (isNil "_pos") exitWith {
	diag_log "I_fnc_createVehicle: invalid position.";
};

if (isNil "_dir") exitWith {
	diag_log "I_fnc_createVehicle: invalid direction.";
};

if (isNil "_respawn") then {
	_respawn = false;
};

if (isNil "_isMHQ") then {
	_isMHQ = false;
};

_vehicle = createVehicle [_type, [_pos select 0, _pos select 1], [], 0, "CAN_COLLIDE"];
_vehicle setPosATL _pos;
_vehicle setDir _dir;

clearItemCargoGlobal 	 _vehicle;
clearWeaponCargoGlobal 	 _vehicle;
clearMagazineCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;

if (_isMHQ isEqualTo true) then {
	[_vehicle] spawn I_fnc_addMobileRespawn;
};

if !(_vehicle isEqualTo objNull) then {
	if (_respawn isEqualTo true) then {
		[_vehicle, _type, _pos, _dir, _respawn,_isMHQ] spawn {
			waitUntil {!(alive (_this select 0))};
			
			sleep 5; // add param delay
			deleteVehicle (_this select 0);
			_call = [_this select 1, _this select 2, _this select 3, _this select 4, _this select 5] call I_fnc_createVehicle;
		};
	};
};