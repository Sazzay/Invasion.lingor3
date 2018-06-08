/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Cleans up inactive, empty, OPFOR vehicles.
*/

[I_DEF_OPFOR_FACTIONS] params [["_factions", []]];

while {true} do {
	{
		[_x, (_x getVariable "I_DELETE_COUNTER")] params ["_veh", ["_count", 0]];
	
		if (_factions isEqualTo []) exitWith {};
	
		if (((faction _veh) in _factions) and ((_veh isKindOf "LandVehicle") or (_veh isKindOf "Air"))) then {
			if ((crew _veh) isEqualTo []) then {
				_veh setVariable ["I_DELETE_COUNTER", _count + 1];
			} else {
				{
					if !(alive _x) then {
						_veh setVariable ["I_DELETE_COUNTER", _count + 1];
					};
				} forEach (crew _veh);
			};
		} else {
			if (_count > 0) then {
				_veh setVariable ["I_DELETE_COUNTER", _count - 1];
			};
		};
		
		if ((_count) >= 5) then {
			deleteVehicle _x;
			diag_log "rt_deleteInactiveVehicles: Deleted inactive vehicle.";
		};
	} forEach vehicles;
	
	sleep 120;
};