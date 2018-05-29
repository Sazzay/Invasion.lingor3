/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Searches in a circular pattern around the position for suitable positions. It does not return positions that are 
	on roads.
	
	Parameters:
	_this select 0: Position2D
	
	Returns:
	ARRAY
	
	Example:
	_call = [[5000, 3000]] call I_fnc_findEmptyNoRoads;
*/

[_this select 0, _this select 1, [], nil] params ["_pos", "_rad", "_return", "_scan"];

if ((isNil "_pos") or (isNil "_rad")) exitWith {
	diag_log "I_fnc_findEmptyNoRoads: no position or radius input specified.";
};

for "_i" from 0 to _rad step 10 do {
	for "_i2" from 0 to 360 step 3.6 do {
		_scan = [(_pos select 0) + (_i * sin _i2), (_pos select 1) + (_i * cos _i2)];
		
		if (!(isOnRoad _scan) and !((_scan isFlatEmpty [15, -1, 0.1, 15, 0, false, objNull]) isEqualTo [])) then {
			_return pushBack _scan;
		};
	};
};

_return