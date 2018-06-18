/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Searches the entire worldSize for a suitable composition position and then returns all the locations.
	
	Parameters:
	_this select 0: INT
	_this select 1: INT
	
	Returns:
	ARRAY
	
	Example:
	[50, 0.2] call I_fnc_findCompositionPos;
*/

[_this select 0, _this select 1, [], nil, (call I_fnc_findAirports)] params ["_radius", "_gradient", "_return", "_fail", "_airports"];

if ((isNil "_radius") or (isNil "_gradient")) exitWith {
	diag_log "FB_fnc_findCompositionPos: No _radius or _gradient specified, invalid.";
};

for "_i" from 0 to worldSize step 50 do {
	for "_i2" from 0 to worldSize step 50 do {
		if !(([_i, _i2] isFlatEmpty [_radius, -1, _gradient, _radius, 0, false, objNull]) isEqualTo []) then {
			{ 
				if (_x distance [_i,_i2] < 800) exitWith {
					_fail = true;
				};
				
				_fail = false;
			} forEach _airports;
			
			if (_fail isEqualTo false) then {
				_return pushBack [_i,_i2, 0];
			};
		};
	};
};

_return