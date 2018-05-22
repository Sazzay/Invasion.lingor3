if !(isServer) exitWith {};

[] execVM "runtime\spawns\vehicularSpawns.sqf";

//_call = [30] call I_fnc_findHostileForce;
[[5041, 8988], 3000] call I_fnc_findNearestWater;