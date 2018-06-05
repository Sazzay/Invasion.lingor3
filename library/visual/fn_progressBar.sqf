/*
	Author: Markus "Sazzay" Larsson
	
	Description: Takes a number, this number represents the amount of bars to display in the progress bar.
	
	Parameters:
	_this select 0: INT
	
	Returns:
	
	Example:
	_call = [0] call I_fnc_progressBar;
*/

disableSerialization;

[_this select 0] params ["_progress"];

if (isNil "_progress") exitWith {
	diag_log "I_fnc_progressBar: _progress can't be nil."
};

if (((uiNameSpace getVariable "I_HUD_PROGRESSBAR") isEqualTo displayNull) and ((uiNameSpace getVariable "I_HUD_PROGRESSBAR_TILES") isEqualTo displayNull)) then {
	("I_HUD_CAPTURE_BASELAYER" call BIS_fnc_rscLayer) cutRsc ["I_HUD_PROGRESSBAR", "PLAIN"];
	("I_HUD_CAPTURE_TILES" call BIS_fnc_rscLayer) cutRsc ["I_HUD_PROGRESSBAR_TILES", "PLAIN"];
};

for "_i" from 0 to 20 do {
	((uiNameSpace getVariable "I_HUD_PROGRESSBAR_TILES") displayCtrl (1200 + _i)) ctrlSetTextColor [1, 1, 1, 0];
};

for "_i" from 0 to (_this select 0) do {
	((uiNameSpace getVariable "I_HUD_PROGRESSBAR_TILES") displayCtrl (1200 + _i)) ctrlSetTextColor [1, 1, 1, 1];
};
