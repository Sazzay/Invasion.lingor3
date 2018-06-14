/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Spawns and returns an AA unit, if it can be suspended, it will also do this efficiently using the
	scheduler.
	
	Parameters:
	_this select 1: Position2D
	
	Types:
	Can be found in definitions/groups.sqf
	
	Returns:
	GROUP
	
	Example:
	_call = [[5000, 3000]] call I_fnc_spawnRandomAA;
*/

[_this select 0, selectRandom [true, false], grpNull, []] params ["_pos", "_bool", "_group", "_return"];

if (isNil "_pos") exitWith {
	diag_log "I_fnc_spawnRandomAA: no _pos provided, invalid.";
};

if (_bool isEqualTo true) then {
	_group = [_pos, 0, selectRandom I_DEF_OPFOR_AA_VEHICLE_GROUPS, EAST] call bis_fnc_spawnvehicle;
} else {	
	_group = createGroup east;
	
	{
		{
			if (canSuspend) then {
				uiSleep 0.1;
				diag_log "I_fnc_spawnRandomAA: Created unit, scheduled & suspended.";
			} else {
				diag_log "I_fnc_spawnRandomAA: Created unit, non-scheduled.";
			};
			
			_group createUnit [_x, _pos, [], 0, "FORM"];
		} forEach _x;
	} forEach I_DEF_OPFOR_AA_GROUPS;
	
	_group deleteGroupWhenEmpty true;
};

if ((typeName _group) isEqualTo "ARRAY") then {
	_return = _group select 2;
} else {
	_return = _group;
};

_return