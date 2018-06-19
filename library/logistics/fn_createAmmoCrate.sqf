/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Creates a crate filled with ammo.
	
	Parameters:
	_this select 0: PositionATL
	
	Returns:
	OBJECT
	
	Example:
	_call = [[2500, 2500, 10]] call I_fnc_createAmmoCrate;
*/

[_this select 0, objNull] params [["_pos", []], "_return"];

sleep 2;

if (_pos isEqualTo []) exitWith {
	diag_log "I_fnc_createAmmoCrate: no position provided.";
};

_return = createVehicle ["CargoNet_01_box_F", _pos, [], 0, "CAN_COLLIDE"];

if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
	[_return,true,[0,1.8,0]] remoteExecCall ["ace_dragging_fnc_setDraggable",0,true];
	[_return, 5] remoteExecCall ["ace_cargo_fnc_setSize",0,true];
	_return enableRopeAttach false;
};

{
	_return addMagazineCargoGlobal [_x select 0, _x select 1];
} forEach I_USMC_MAGAZINES;

if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
	{
		_return addItemCargoGlobal [_x select 0, _x select 1];
	} forEach I_USMC_ACE_MEDICINE;
} else {
	{
		_return addItemCargoGlobal [_x select 0, _x select 1];
	} forEach I_USMC_DEFAULT_MEDICINE;
};

_return
