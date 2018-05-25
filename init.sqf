if !(isServer) exitWith {};

// Definitions
[] execVM "definitions\groups.sqf";

// Runtime
[] execVM "runtime\spawns\rt_vehicularSpawns.sqf";
[] execVM "runtime\acs\rt_tickHostileAir.sqf";
[] execVM "runtime\acs\rt_tickHostileBoatPatrol.sqf";
[] execVM "runtime\acs\rt_tickHostileForce.sqf";

//_hostiles = [15] call I_fnc_findHostileForce;

//_call = ["Test", 5] call I_fnc_timedBool;

//[5] call I_fnc_findHostileBoatPatrol;

//_call = [[4400, 8600]] call I_fnc_findAAPos;

//_call = [(_hostiles select 0), 500, 2000, ((_hostiles select 1) - 180)] call I_fnc_findEmptyLine;