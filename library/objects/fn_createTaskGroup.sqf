/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	A small function to support the re-written rt_tickTaskDefense with a global var. Can only be
	ran in a scheduled enviroment.
	
	Parameters:
	_this select 0: OBJECT
	
	Returns:
	
	Example:
	_call = [[[5000, 3000], [5000, 3000]]] call I_fnc_createTaskGroup;
*/

[_this select 0, []] params ["_obj", "_objects"];

if (isNil "_obj") exitWith {
	diag_log "I_fnc_createTaskGroup: _obj invalid.";
};

if !(canSuspend) exitWith {
	diag_log "I_fnc_createTaskGroup: function attempted to run in a scheduled enviroment, exiting (not allowed!).";
};

for "_i" from 0 to 2 do {
	[([getPos _obj, (50 + random 50), (300 + random 100), 7, 0, 0.5, 0, [], []] call BIS_fnc_findSafePos), grpNull] params ["_scan", "_group"];

	if !(_scan isEqualTo (getArray (configfile >> "CfgWorlds" >> worldName >> "centerPosition"))) then {
		_group = [[_scan select 0, _scan select 1], selectRandom ["VDV-EMR-SQUAD-SPC", "VDV-EMR-SQUAD-AT", "VDV-EMR-SQUAD-RECON"],	selectRandom [true, false]] call I_fnc_createGroupEfficient;
		[_group, getPos _obj, 400, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "STAG COLUMN", "_group call CBA_fnc_searchNearby", [3,6,9]] call CBA_fnc_taskPatrol;
					
		{
			_objects pushBack _x;
			
			if (!((vehicle _x) isEqualTo _x) and !((vehicle _x) in _objects)) then {
				_objects pushBack (vehicle _x);
			};
		} forEach (units _group);
	};
};

[format ["ADS_TASK_%1_DYN_OBJECTS", _obj], _objects] call I_fnc_setVariable;