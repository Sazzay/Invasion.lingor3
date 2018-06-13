/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every base 15 seconds (modifiers to be added) this runtime script checks if there is a large enough hostile force to
	dispatch friendly units to. If true, it will spawn a random amount of groups in the direction away from the
	position in question.
*/

[[], [], []] params ["_array", "_positions", "_var"];

["RESTRICT_ACS_LAND", 0] call I_fnc_timedBool;

while {true} do {
	[([6] call I_fnc_findHostileForce), (["ADS_TASK_RRS", [0, 0, 0]] call I_fnc_getVariable), []]params ["_array", "_var", "_groups"];
	
	if (!(_array isEqualTo [[0, 0], 0]) and ((missionNamespace getVariable "RESTRICT_ACS_LAND") isEqualTo false)) then {
		_positions = [(_array select 0), 300, 1000, ((_array select 1) - 180)] call I_fnc_findEmptyLine;
		
		if !(_positions isEqualTo []) then {
			for "_i" from 0 to ((count _positions) - 1) step ((round (count _positions)) / 4) do {
				_groups pushBack ([(_positions select _i), selectRandom ["MSV-EMR-SQUAD", "VDV-EMR-SQUAD-SPC", "MSV-EMR-SQUAD-MM", "VDV-EMR-SQUAD-RECON", "VMF-EMR-SQUAD-RECON"], true] call I_fnc_createGroupEfficient);
			};
			
			["RESTRICT_ACS_LAND", 700 - (random 150) + (random 150) - ((_var select 1) * 20)] call I_fnc_timedBool;
		} else {
			diag_log "rt_tickHostileForce: no suitable spawn positions have been found.";
		};
		
		{
			[_x] call I_fnc_deleteInactive;
			[_x, (_array select 0)] call I_fnc_taskGroupAssault;
		} forEach _groups;
	};
	
	sleep 15;
};