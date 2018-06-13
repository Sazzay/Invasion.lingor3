/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Takes an array and deletes every object found in that array.
	
	Parameters:
	_this select 0: ARRAY
	
	Returns:
	
	Example:
	_call = [[_obj1, _obj2]] call I_fnc_deleteObjects;
*/

[_this select 0] params ["_array"];

if (isNil "_array") exitWith {
	diag_log "I_fnc_deleteObjects: _array is nil, invalid.";
};

{
	if !(isNull _x) then {
		deleteVehicle _x;
	};
} forEach _array;