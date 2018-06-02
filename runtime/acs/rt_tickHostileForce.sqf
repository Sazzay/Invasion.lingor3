/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every base 15 seconds (modifiers to be added) this runtime script checks if there is a large enough hostile force to
	dispatch friendly units to. If true, it will spawn a random amount of groups in the direction away from the
	position in question.
	
	Notes: 0.56~ execution time maximum.
*/

[[], [], [], []] params ["_array", "_positions", "_groups", "_var"];

["RESTRICT_ACS_LAND", 0] call I_fnc_timedBool;

while {true} do {
	_array = [6] call I_fnc_findHostileForce;
	_var = (["ADS_TASK_RRS", [0, 0, 0]] call I_fnc_getVariable);
	
	if (!(_array isEqualTo [[0, 0], 0]) and ((missionNamespace getVariable "RESTRICT_ACS_LAND") isEqualTo false)) then {
		_positions = [(_array select 0), 300, 800, ((_array select 1) - 180)] call I_fnc_findEmptyLine;
		
		if !(_positions isEqualTo []) then {
			{
				if ((random 100) < 15) then {
					_groups pushBack ([(selectRandom I_DEF_LAND_INF_GROUPS), _x] call I_fnc_createGroup);
				};
			} forEach _positions;
			
			if (_groups isEqualTo []) then {
				_groups pushBack ([(selectRandom I_DEF_LAND_INF_GROUPS), (selectRandom _positions)] call I_fnc_createGroup);
			};
		} else {
			diag_log "rt_tickHostileForce: no suitable spawn positions have been found.";
		};
		
		{
			[_x, (_array select 0)] call I_fnc_taskGroupAssault;
			[_x] call I_fnc_deleteInactive;
		
			{
				_x setDir ((_array select 1) - 180);
			} forEach (units _x);
		} forEach _groups;
		
		["RESTRICT_ACS_LAND", 700 - (random 150) + (random 150) - ((_var select 1) * 20)] call I_fnc_timedBool;
	};
	
	sleep 15;
};