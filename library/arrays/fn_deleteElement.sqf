/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Finds the specified value in a specified array, deletes it and then returns the new, corrected array.
	
	Parameters:
	_this select 0: ANY
	_this select 0: ARRAY
	
	Returns:
	ARRAY
	
	Example:
	_call = [[5000, 3000], [[5000, 3000], [5000, 3500]]] call I_fnc_deleteElement;
*/

[_this select 0, _this select 1, nil] params ["_var", "_array", "_return"];

if ((isNil "_var") or (isNil "_array")) exitWith {
	diag_log "I_fnc_deleteElement: _var or _array not defined.";
};

if (_array find _var > -1) then {
	_array deleteAt (_array find _var);
};

_return = _array;

_return