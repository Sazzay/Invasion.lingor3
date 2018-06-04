/*
	Author: Markus "Sazzay" Larsson
	
	Description: Adds an event handler and some percentage chances for support events to occur.
	
*/

["RESTRICT_AISS_PARA", 0] call I_fnc_timedBool;

addMissionEventHandler ["EntityKilled", {
	params ["_killed", "_killer", "_instigator", "_var"];
	_var = (["ADS_TASK_RRS", [0, 0, 0]] call I_fnc_getVariable);

	if (((side _killer) isEqualTo west) and ((missionNamespace getVariable "RESTRICT_AISS_PARA") isEqualTo false)) then {
		if ((random 100) < (5 + (_var select 2))) then {
			if ((random 100) < 50) then {
				[2, (getPos _killer)] call I_fnc_paraAssaultSquadron;
			} else {
				[4, (getPos _killer)] call I_fnc_paraAssaultSquadron;
			};
			
			hint str (getPos _killer);
			
			["RESTRICT_AISS_PARA", 800 - random 150 + random 150 - ((_var select 2) * 20)] call I_fnc_timedBool;
		};
	};
}];