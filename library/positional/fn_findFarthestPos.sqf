/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Selects the farthest position and returns it.
	
	Parameters:
	_this select 0: Position2D
	_this select 1: ARRAY
	
	Returns:
	Position2D
	
	Example:
	_call = [[5000, 3000], [[5000, 2500],[2000, 3000]]] call I_fnc_findFarthestPos;
*/

[_this select 0, _this select 1, [], nil] params ["_pos", "_positions", "_distances", "_return"];

if ((isNil "_pos") or (isNil "_positions")) exitWith {
	diag_log "I_fnc_findFarthestPos: _pos or _positions not defined.";
};

if !(_positions isEqualTo []) then {
	{
		_distances pushBack (_pos distance2D _x);
	} forEach _positions;
	
	_return = [(_positions select (_distances find (selectMax _distances))) select 0, (_positions select (_distances find (selectMax _distances))) select 1, 0];
};

_return