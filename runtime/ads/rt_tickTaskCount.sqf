/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Counts one of the global vars set by tickTaskDefense and sets a couple of other variables accordingly.
*/

while {true} do {
	sleep 20;

	[(missionNamespace getVariable "ADS_TASK_ALLOBJECTS"), 0, 0, 0] params ["_array", "_radar", "_reinforcement", "_support"];

	{
		if ((typeOf _x) in ["rhs_prv13", "rhs_p37", "RU_WarfareBArtilleryRadar", "RU_WarfareBAntiAirRadar"] and (alive _x)) then {
			_radar = _radar + 1;
		};
		if ((typeOf _x) in ["RU_WarfareBBarracks", "RU_WarfareBHeavyFactory"] and (alive _x)) then {
			_reinforcement = _reinforcement + 1;
		};
		if ((typeOf _x) in ["Land_fort_artillery_nest", "RU_WarfareBUAVterminal"] and (alive _x)) then {
			_support = _support + 1;
		};
	} forEach _array;
	
	["ADS_TASK_RRS", [_radar, _reinforcement, _support]] call I_fnc_setVariable;
};