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
	while {true} do {
		sleep 600;
		
		[false] params ["_exit"];
						
		if ((((units (_this select 0)) select 0) findNearestEnemy ((units (_this select 0)) select 0)) isEqualTo objNull) then {
			if ((count ([(getPos (vehicle (leader (_this select 0)))), 2000] call I_fnc_findPlayers)) isEqualTo 0) then {
				{
					deleteVehicle _x;
				} forEach (units (_this select 0));
								
				_exit = true;
			};
		};
		
		if (_exit isEqualTo true) exitWith {
			diag_log "I_fnc_deleteInactive: units removed from inactivity."
		};
	};
};