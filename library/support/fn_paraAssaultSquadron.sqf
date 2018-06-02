/*
	Author: Markus "Sazzay" Larsson
	
	Description: 
	Spawns a specified number of helicopters with a full squad of units. It then proceeds to a waypoint and when within
	a certain distance (vector2D distance) it paradrops the units and the rest of the helicopters fly away. Returns
	the created objects per group.
	
	Parameters:
	_this select 0: INT
	_this select 1: Position2D
	
	Returns:
	ARRAY
	
	Example:
	_call = [4, [1244, 637]] call I_fnc_paraAssaultSquadron;
*/

[_this select 0, ([[0, 0], 50, 500, 20, 1, 1, 0, [], []] call BIS_fnc_findSafePos), _this select 1] params ["_amount", "_pos", "_target"];

if (isNil "_amount") exitWith {
	diag_log "I_fnc_paraAssaultSquadron: no amount or invalid amount specified.";
};

for "_i" from 0 to _amount do {
	[([[_pos select 0, (_pos select 1) + (_i * 100)], 0, "RHS_Mi8MTV3_vvsc", EAST] call bis_fnc_spawnvehicle), nil] params ["_veh", "_group"];

	(_veh select 0) setPosASL [(_pos select 0) + (_i * 100), (_pos select 1) + (_i * 100), 300];

	_group = ([(selectRandom I_DEF_LAND_AMBUSH_GROUPS), [_pos select 0, (_pos select 1) + (_i * 50)]] call I_fnc_createGroup);

	{
		_x moveInAny (_veh select 0);
	} forEach (units _group);
	
	{
		_x doMove _target;
	} forEach (_veh select 1);
	
	[_group, _veh, _target] spawn {
		waitUntil {((getPos (leader (_this select 0))) distance2D (_this select 2)) < 400};
		
		hint "test";
		
		{
			moveOut _x;
		
			[("ParachuteEast" createVehicle (getPos _x))] params ["_chute"];
			
			sleep 0.02;
			
			_x attachTo [_chute, [0, 0, -2]];
			
			sleep 0.04;
		} forEach (units (_this select 0));
	};
};