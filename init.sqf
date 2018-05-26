if !(isServer) exitWith {};

// Definitions
[] execVM "definitions\groups.sqf";
[] execVM "definitions\vehicles.sqf";

// Runtime
[] execVM "runtime\spawns\rt_vehicularSpawns.sqf";
[] execVM "runtime\acs\rt_tickHostileAir.sqf";
[] execVM "runtime\acs\rt_tickHostileBoatPatrol.sqf";
[] execVM "runtime\acs\rt_tickHostileForce.sqf";

//[5] call I_fnc_findHostileBoatPatrol;

//hint str (nearestLocations [[0, 0], ["NameCity", "NameCityCapital", "NameVillage"], 15000]);
