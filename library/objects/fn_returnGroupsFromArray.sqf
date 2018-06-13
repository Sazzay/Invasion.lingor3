/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Takes an array of objects and returns an array of groups attached to those objects.
	
	Parameters:
	_this select 0: ARRAY

	Returns:
	ARRAY
	
	Example:
	_call = [[_obj, _obj2]] call I_fnc_returnGroupsFromArray;
*/

[_this select 0, []] params ["_array", "_return"];

if (isNil "_array") exitWith {
	diag_log "I_fnc_deleteInactive: _array is nil, invalid.";
};

{
	if !(isNull (group _x)) then {
		if !((group _x) in _return) then {
			_return pushBack (group _x);
		};
	};
} forEach _array;

_return