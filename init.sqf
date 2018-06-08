if !(isServer) exitWith {};

// Definitions
[] execVM "definitions\locations.sqf";
[] execVM "definitions\groups.sqf";
[] execVM "definitions\vehicles.sqf";
[] execVM "definitions\objects.sqf";
[] execVM "definitions\units.sqf";
[] execVM "definitions\factions.sqf";

// Runtime
[] execVM "runtime\spawns\rt_vehicularSpawns.sqf";
[] execVM "runtime\acs\rt_tickHostileAir.sqf";
[] execVM "runtime\acs\rt_tickHostileBoatPatrol.sqf";
[] execVM "runtime\acs\rt_tickHostileForce.sqf";
[] execVM "runtime\ads\rt_tickTownDefense.sqf";
[] execVM "runtime\ads\rt_tickTaskDefense.sqf";
[] execVM "runtime\ads\rt_tickTaskCount.sqf";
[] execVM "runtime\support\rt_aiSupport.sqf";
//[] execVM "runtime\maintenance\rt_deleteInactiveVehicles.sqf";

// LHD respawn
I_RESPAWN_LHD = [west, [6690.31,10032.1,16.6477], "USMC LHD"] call BIS_fnc_addRespawnPosition; // getPosASL player;