/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Every second this listener checks whetever or not the player is close enough to towns, and if he is it will display
	a capture HUD.
*/

[[] call I_fnc_findTowns] params ["_towns"];

while {true} do {	
	[([(getPos player), _towns] call I_fnc_findNearestPos)] params ["_pos"];
	
	if (((vehicle player) isKindOf "Man") and (alive player)) then {
		[(missionNamespace getVariable format ["ADS_TOWN_%1", _pos])] params ["_var"];
	
		if (((player distance _pos) < 50)) then {
			if ((round (_var select 2)) >= 21) then {
				[0.5] call I_fnc_progressBarFade;
			} else {
				[(floor (_var select 2))] call I_fnc_progressBar;
			};
		} else {
			[0.3] call I_fnc_progressBarFade;
		};
	} else {
		[0.3] call I_fnc_progressBarFade;
	};
	
	sleep 1;
};