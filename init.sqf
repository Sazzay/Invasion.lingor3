if !(isServer) exitWith {};

// Definitions
[] execVM "definitions\locations.sqf";
[] execVM "definitions\groups.sqf";
[] execVM "definitions\vehicles.sqf";
[] execVM "definitions\objects.sqf";
[] execVM "definitions\units.sqf";

// Runtime
[] execVM "runtime\spawns\rt_vehicularSpawns.sqf";
[] execVM "runtime\acs\rt_tickHostileAir.sqf";
[] execVM "runtime\acs\rt_tickHostileBoatPatrol.sqf";
[] execVM "runtime\acs\rt_tickHostileForce.sqf";
[] execVM "runtime\ads\rt_tickTownDefense.sqf";
[] execVM "runtime\ads\rt_tickTaskDefense.sqf";
[] execVM "runtime\ads\rt_tickTaskCount.sqf";

sleep 1;

<<<<<<< HEAD
[4, [1244, 637]] call I_fnc_paraAssaultSquadron;
=======
// LHD respawn
respawn_LHD = [west, [6690.31,10032.1,16.6477], "USMC LHD"] call BIS_fnc_addRespawnPosition; // getPosASL player;
>>>>>>> 7bc6e687e80f4c2f7519775935c15de49e3c41c8
