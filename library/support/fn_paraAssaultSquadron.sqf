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

for "_i" from 0 to (_amount - 1) do {
	[([[_pos select 0, (_pos select 1) + (_i * 100)], 0, "RHS_Mi8MTV3_vvsc", EAST] call bis_fnc_spawnvehicle), nil] params ["_veh", "_group"];

	(_veh select 0) setPosASL [(_pos select 0) + (_i * 100), (_pos select 1) + (_i * 100), 300];
	(_veh select 0) flyInHeightASL [300, 300, 300];

	_group = ([(selectRandom I_DEF_LAND_AMBUSH_GROUPS), [_pos select 0, (_pos select 1) + (_i * 50)]] call I_fnc_createGroup);

	{
		_x moveInAny (_veh select 0);
	} forEach (units _group);
	
	{
		_x doMove [((_target select 0) + (50 * _i)), ((_target select 1) + (50 * _i))];
	} forEach (_veh select 1);
	
	[_group, _veh, _target] spawn {
		waitUntil {((getPos (leader (_this select 0))) distance2D (_this select 2)) < 300};

		[((_this select 1) select 0)] call RHS_fnc_infantryParadrop;
		
		{
			doStop _x;
			_x doMove [10200, 1730];
			
			[_x] spawn {
				waitUntil {((getPos (_this select 0)) distance2D [10200, 1730]) < 300};
				
				{
					deleteVehicle _x
				} forEach (crew (_this select 0));
				
				deleteVehicle (_this select 0);
			};
		} forEach ((_this select 1) select 1);

		[((_this select 1) select 2)] call I_fnc_deleteInactive;
	};
};

// "rhs_d6_Parachute_backpack"