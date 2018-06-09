/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Checks whetever or not the given object is eligble to operate the vehicle that it has entered
	
	Parameters:
	_this select 0: OBJECT
	
	Returns:
	
	Example:
	_call = [player] call I_fnc_vehicularEligibility;
*/

[_this select 0, false, false] params ["_object", "_fail", "_exit"];

if (isNil "_object") exitWith {
	diag_log "I_fnc_vehicularEligibility: no object provided.";
};

if ((_this select 1) isEqualTo "cargo") exitWith {};

{
	if (((vehicle _object) isKindOf (_x select 0)) and !((typeOf (vehicle _object)) isEqualTo "Steerable_Parachute_F")) then {
		if ((typeOf _object) != (_x select 1)) then {
			_fail = true;
		};
	};
} forEach [["Plane", "rhsusf_airforce_jetpilot"], ["Wheeled_APC_F", "rhsusf_usmc_marpat_wd_combatcrewman"], ["Helicopter", "rhsusf_usmc_marpat_wd_helipilot"]];

if ((_fail) isEqualTo true) then {
	moveOut _object;
	["You are not qualified to operate this vehicle."] spawn I_fnc_notification;
};