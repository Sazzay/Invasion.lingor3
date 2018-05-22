if !(isServer) exitWith {};

[] execVM "runtime\spawns\vehicularSpawns.sqf";

_call = [30] call I_fnc_findHostileForce;