if !(isServer) exitWith {};

// Definitions
[] execVM "definitions\def_serverLocations.sqf";
[] execVM "definitions\def_serverGroups.sqf";
[] execVM "definitions\def_serverVehicles.sqf";
[] execVM "definitions\def_serverObjects.sqf";
[] execVM "definitions\def_serverUnits.sqf";
[] execVM "definitions\def_serverFactions.sqf";
[] execVM "definitions\def_serverMagazines.sqf";
[] execVM "definitions\def_serverCompositions.sqf";

// Runtime
[] execVM "runtime\spawns\rt_vehicularSpawns.sqf";
[] execVM "runtime\acs\rt_tickHostileAir.sqf";
[] execVM "runtime\acs\rt_tickHostileBoatPatrol.sqf";
[] execVM "runtime\acs\rt_tickHostileForce.sqf";
[] execVM "runtime\ads\rt_tickTownDefense.sqf";
[] execVM "runtime\ads\rt_tickTaskDefense.sqf";
[] execVM "runtime\ads\rt_tickTaskCount.sqf";
[] execVM "runtime\ads\rt_tickStaticAA.sqf";
[] execVM "runtime\support\rt_aiSupport.sqf";
[] execVM "runtime\maintenance\rt_deleteInactiveVehicles.sqf";
[] execVM "runtime\maintenance\rt_deleteUnderwaterVehicles.sqf";
[] execVM "runtime\logistics\rt_crateRespawner.sqf";
[] execVM "runtime\logistics\rt_serviceArea.sqf";

// LHD respawn
I_RESPAWN_LHD = [west, [6690.31,10032.1,16.6477], "USMC LHD"] call BIS_fnc_addRespawnPosition; // getPosASL player;