if !(isServer) exitWith {};

// Definitions
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

//[] call I_fnc_findTowns;
while {true} do {
[[5135, 8107], 300] call I_fnc_findPlayers;
sleep 0.5;
};