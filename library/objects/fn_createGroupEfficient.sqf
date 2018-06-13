/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Crates a group very efficiently by delaying execution by 20 ms. Uses pvar's to fetch the units. If the bool is specified
	as true, it will spawn with a random vehicle (wip) attached to the squad. This function won't work well in a non scheduled
	enviroment, be mindful of this. So make sure you call it from a scheduled enviroment.
	
	Parameters:
	_this select 0: Position2D
	_this select 1: ARRAY
	_this select 2: BOOL
	
	Types:
	Can be found in definitions/groups.sqf
	
	Returns:
	GROUP
	
	Example:
	_call = ["MSV-BMP3M-SQUAD", [5000, 3000]] call I_fnc_createGroupEfficient;
*/

[_this select 0, _this select 1, _this select 2, nil, grpNull] params ["_pos", "_type", "_vehbool", "_index", "_return"];

if ((isNil "_pos") or (isNil "_type") or (isNil "_vehbool")) exitWith {
	diag_log "I_fnc_createGroupEfficient: one of the three parameters _pos, _array or _vehbool not defined.";
};

{
	if (_type in _x) exitWith {
		_index = _forEachIndex;
	};
} forEach I_DEF_OPFOR_GROUPS;

if (isNil "_index") exitWith {
	diag_log "I_fnc_createGroupEfficient: _type is not valid";
};

_return = createGroup east;

{
	[{((_this select 0) createUnit [(_this select 1), (_this select 2), [], 0, "FORM"])}, [_return, _x, _pos], (0.2 * _forEachIndex)] call CBA_fnc_waitAndExecute;
} forEach (I_DEF_OPFOR_GROUPS select _index select 1);

if (canSuspend) then {
	waitUntil {(count (units _return)) >= (count (I_DEF_OPFOR_GROUPS select _index select 1))};
	_return deleteGroupWhenEmpty true;
} else {
	[{(_this select 0) deleteGroupWhenEmpty true;}, [_return], (0.2 * (count (I_DEF_OPFOR_GROUPS select _index select 1)))] call CBA_fnc_waitAndExecute;
};

if ((_vehbool) isEqualTo true) then {
	[selectRandom I_DEF_VEHICLES_APC, _pos, getDir (leader _return), _return] call I_fnc_createCrewedVehicle;
};

[_return] call I_fnc_aiSkill;

_return