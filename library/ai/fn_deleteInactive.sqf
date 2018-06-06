/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Creates a group of preset units as per defined in definitions.
	
	Parameters:
	_this select 0: GROUP

	Returns:
	
	Example:
	_call = [_group1] call I_fnc_deleteInactive;
*/

[_this select 0] params ["_group"];

if (isNil "_group") exitWith {
	diag_log "I_fnc_deleteInactive: no group specified.";
};

[_group] spawn {
	[0] params ["_count"];

	while {true} do {
		sleep 300;
						
		if ((((units (_this select 0)) select 0) findNearestEnemy ((units (_this select 0)) select 0)) isEqualTo objNull) then {
			if ((count ([(getPos (vehicle (leader (_this select 0)))), 2500] call I_fnc_findPlayers)) isEqualTo 0) then {
				_count = _count + 1;
			} else {
				_count = 0;
			};
		} else {
			_count = 0;
		};
		
		hint str _count;
		
		if ((_count) >= 5) exitWith {
			{
				deleteVehicle _x;
			} forEach (units (_this select 0));
		
			diag_log "I_fnc_deleteInactive: units removed from inactivity.";
		};
	};
};