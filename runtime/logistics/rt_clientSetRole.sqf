/*
	Author: Panda
	
	Description:
	Ensures that classes have the appropriate role.
*/
private ["_unit"];

if ((typeOf player) in I_USMC_CLASS_MEDIC) exitWith {

	player setUnitTrait ["Medic",true];

	if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {

		player setVariable ["ace_medical_medicClass", 1, true]; 
	};
};

if ((typeOf player) in I_USMC_CLASS_ENGINEER) exitWith {

	_unit setUnitTrait ["Engineer",true];

	if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {

		player setVariable ["ace_IsEngineer", 1, true]; 
	};
};

if ((typeOf player) in I_USMC_CLASS_EOD) exitWith {

	player setUnitTrait ["explosiveSpecialist",true];
};
