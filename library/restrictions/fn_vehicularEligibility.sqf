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

[objNull, false, false] params ["_object", "_fail", "_exit"];

if ((_this select 0) != objNull) then {
	_object = _this select 0;
} else {
	diag_log format ["vehicularEligibility error, object: ", _object];
};

if ((_this select 1) isEqualTo "cargo") exitWith {};

if ((vehicle _object) isKindOf "Plane")  then {
	if ((typeOf _object) != "rhsusf_airforce_jetpilot") then {
		_fail = true;
	};
};

if ((vehicle _object) isKindOf "Tank") then {
	if ((typeOf _object) != "rhsusf_army_ocp_crewman") then {
		_fail = true;
	};	
};

if ((vehicle _object) isKindOf "Helicopter") then {
	if ((typeOf _object) != "rhsusf_airforce_pilot") then {
		_fail = true;
	};
};

// Debug
hint format ["Player: %1, Vehicle: %2, Fail: %3", _object, vehicle _object, _fail];

if ((_fail) isEqualTo true) then {
	moveOut _object;
	["You are not qualified to operate this vehicle."] spawn I_fnc_notification;
};