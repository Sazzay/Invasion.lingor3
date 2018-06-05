/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every second this listener checks whetever or not the player is close enough to towns, and if he is it will display
	a capture HUD.
*/

[[] call I_fnc_findTowns] params ["_towns"];

while {true} do {
	{
		[(missionNamespace getVariable format ["ADS_TOWN_%1", [_x select 0, _x select 1]]), ((getPosATL player) select 2)] params ["_var", "_height"];
	
		if ((vehicle player) isKindOf "Man") then {
			if (((player distance _x) < 50)) then {
				if ((round (_var select 2)) >= 21) then {
					[0.5] call I_fnc_progressBarFade;
				} else {
					[(round (_var select 2))] call I_fnc_progressBar;
				};
			};
			
			if (((player distance _x) > 50) and ((player distance _x) < 150)) then {
				[0.5] call I_fnc_progressBarFade;
			};
		} else {
			[0.5] call I_fnc_progressBarFade;
		};
	} forEach _towns;
	
	sleep 1;
};