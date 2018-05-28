[[] call I_fnc_findTowns] params ["_towns"];

{
	[format ["ADS_TOWN_%1", [_x select 0, _x select 1]], false] call I_fnc_setVariable;
} forEach _towns;

[{
	[_this select 0 select 0, []] params ["_pos", "_array"];

	{
		if (count ([_x, 500] call I_fnc_findPlayers) >= 1) then {
			_array set [_forEachIndex, [[_x select 0, _x select 1], true]];
		} else {
			_array set [_forEachIndex, [[_x select 0, _x select 1], false]];
		};
	} forEach _pos;
	
	{
		if (((_x select 1) isEqualTo true) and ((missionNamespace getVariable format ["ADS_TOWN_%1", (_x select 0)]) isEqualTo false)) then {
			[format ["ADS_TOWN_%1", (_x select 0)], true] call I_fnc_setVariable;
			diag_log format ["ADS_TOWN_%1: Active", (_x select 0)];
		};
		if (((_x select 1) isEqualTo false) and ((missionNamespace getVariable format ["ADS_TOWN_%1", (_x select 0)]) isEqualTo true)) then {
			[format ["ADS_TOWN_%1", (_x select 0)], false] call I_fnc_setVariable;
			diag_log format ["ADS_TOWN_%1: Inactive", (_x select 0)];
		};
	} forEach _array;
	


}, 1, [_towns]] call CBA_fnc_addPerFrameHandler;

// test -> no change -> test 2, spam repeat test2