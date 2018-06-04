/*
	Author: Markus "Sazzay" Larsson
	
	Description: Adds an event handler and some percentage chances for support events to occur.
	
*/

["RESTRICT_AISS_PARA", 0] call I_fnc_timedBool;
["RESTRICT_AISS_ARTILLERY", 0] call I_fnc_timedBool;

addMissionEventHandler ["EntityKilled", {
	params ["_killed", "_killer", "_instigator", "_var"];
	_var = (["ADS_TASK_RRS", [0, 0, 0]] call I_fnc_getVariable);

	if (((side _killer) isEqualTo west) and ((missionNamespace getVariable "RESTRICT_AISS_PARA") isEqualTo false)) then {
		if ((random 100) < (5 + (_var select 2))) then {
			[(selectRandom [2, 4]), (getPos _killer)] call I_fnc_paraAssaultSquadron;
			
			["RESTRICT_AISS_PARA", 800 - random 150 + random 150 - ((_var select 2) * 20)] call I_fnc_timedBool;
		};
	};
	
	if (((side _killer) isEqualTo west) and ((missionNamespace getVariable "RESTRICT_AISS_ARTILLERY") isEqualTo false)) then {
		if ((random 100) < (3 + (_var select 2))) then {
			[4, (getPos _killer)] call I_fnc_artilleryPlatoon;
	
			["RESTRICT_AISS_ARTILLERY", 1200 - random 150 + random 150 - ((_var select 2) * 40)] call I_fnc_timedBool;
		};
	};
}];