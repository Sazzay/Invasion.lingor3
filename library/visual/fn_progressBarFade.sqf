/*
	Author: Markus "Sazzay" Larsson
	
	Description: Takes a number, this number represents the amount of bars to display in the progress bar. If -1 is provided
	it deletes the progress bar. Only one progress bar may run at a time.
	
	Parameters:
	_this select 0: INT
	
	Returns:
	
	Example:
	_call = [0] call I_fnc_progressBarFade;
*/

disableSerialization;

[_this select 0] params ["_fade"];

if (isNil "_fade") exitWith {
	diag_log "I_fnc_progressBarFade: _fade can't be nil."
};

if (!((uiNameSpace getVariable "I_HUD_PROGRESSBAR") isEqualTo displayNull) and !((uiNameSpace getVariable "I_HUD_PROGRESSBAR_TILES") isEqualTo displayNull)) then {
	("I_HUD_CAPTURE_BASELAYER" call BIS_fnc_rscLayer) cutFadeOut _fade;
	("I_HUD_CAPTURE_TILES" call BIS_fnc_rscLayer) cutFadeOut _fade;
};