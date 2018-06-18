/*
	Author: Panda
	
	Description:
	Ensures that classes have the appropriate role.
*/

[player] params ["_unit"];

if ((typeOf _unit) in I_USMC_CLASS_MEDIC) exitWith {
	_unit setUnitTrait ["Medic",true];

	if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
		_unit setVariable ["ace_medical_medicClass", 1, true]; 
	};
};

if ((typeOf _unit) in I_USMC_CLASS_ENGINEER) exitWith {
	_unit setUnitTrait ["Engineer",true];

	if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
		_unit setVariable ["ace_IsEngineer", 1, true]; 
	};
};

if ((typeOf _unit) in I_USMC_CLASS_EOD) exitWith {
	_unit setUnitTrait ["explosiveSpecialist",true];
};
