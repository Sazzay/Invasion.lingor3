/*
	Author: Markus "Sazzay" Larsson
	
	Description: Takes a number, this number represents the amount of bars to display in the progress bar.
	
	Parameters:
	_this select 0: INT
	_this select 2: STRING
	
	Returns:
	
	Example:
	_call = [0] call I_fnc_progressBar;
*/

disableSerialization;

[_this select 0, _this select 1] params ["_progress", "_text"];

if (isNil "_progress") exitWith {
	diag_log "I_fnc_progressBar: _progress can't be nil.";
};

if ((isNil {(uiNamespace getVariable "I_HUD_PROGRESSBAR")}) and (isNil {(uiNamespace getVariable "I_HUD_PROGRESSBAR_TILES")})) then {
	{
		uiNamespace setVariable [_x, displayNull];
	} forEach ["I_HUD_PROGRESSBAR", "I_HUD_PROGRESSBAR_TILES"];
};

if ((uiNamespace getVariable "I_HUD_PROGRESSBAR") isEqualTo displayNull and (uiNamespace getVariable "I_HUD_PROGRESSBAR_TILES") isEqualTo displayNull) then {
	("I_HUD_CAPTURE_BASELAYER" call BIS_fnc_rscLayer) cutRsc ["I_HUD_PROGRESSBAR", "PLAIN"];
	("I_HUD_CAPTURE_TILES" call BIS_fnc_rscLayer) cutRsc ["I_HUD_PROGRESSBAR_TILES", "PLAIN"];
};

if !(isNil "_text") then {
	if !((ctrlText ((uiNameSpace getVariable "I_HUD_PROGRESSBAR") displayCtrl 1500)) isEqualTo _text) then {
		((uiNameSpace getVariable "I_HUD_PROGRESSBAR") displayCtrl 1500) ctrlSetText _text;
	};
};

for "_i" from 0 to 20 do {
	((uiNameSpace getVariable "I_HUD_PROGRESSBAR_TILES") displayCtrl (1200 + _i)) ctrlSetTextColor [1, 1, 1, 0];
};

for "_i" from 0 to _progress do {
	((uiNameSpace getVariable "I_HUD_PROGRESSBAR_TILES") displayCtrl (1200 + _i)) ctrlSetTextColor [1, 1, 1, 1];
};
