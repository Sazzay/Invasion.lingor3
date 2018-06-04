/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Spawns specified amount of artillery around a position near the designated position and then orders that artillery to fire
	on that location. Deletes itself due to inactivity after a while.
	
	Parameters:
	_this select 0: INT
	_this select 1: Position2D
	
	Returns:
	
	Example:
	_call = [4, [1244, 637]] call I_fnc_artilleryPlatoon;
*/

[_this select 0, _this select 1] params ["_amount", "_pos"];

if ((isNil "_amount") or (isNil "_pos")) exitWith {
	diag_log "I_fnc_artilleryPlatoon: _amount or _position not specified or invalid.";
};

[([_pos] call I_fnc_findArtilleryPos)] params ["_scan"];

for "_i" from 0 to (_amount - 1) do {
	[objNull] params ["_veh"];

	if !(_scan isEqualTo []) then {
		_veh = [[(_scan select 0) + (_i * 10), (_scan select 1)], ([_scan, _pos] call BIS_fnc_dirTo), "rhs_2s3_tv", EAST] call BIS_fnc_spawnVehicle;
		(_veh select 0) doArtilleryFire [_pos, "rhs_mag_HE_2a33", 12];
		(_veh select 2) deleteGroupWhenEmpty true;
		
		[_veh] spawn {
			sleep 300;
			
			{
				deleteVehicle _x;
			} forEach (_this select 0 select 1);
			
			deleteVehicle (_this select 0 select 0);
		};
	};
};