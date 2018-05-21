/*
	Author: Markus "Sazzay" Larsson
	
	Description: Sends a notification, takes text only.
	
	Parameters:
	_this select 0: STRING
	
	Returns:
	
	Example:
	_call = ["Can not build here"] call fnc_notification;
*/

if (count _this isEqualTo 0) exitWith {
	hint "fnc_notification: Insufficient information provided.";
};

[_this select 0] params ["_text"];

("I_HUD_NOTIFICATION_LAYER" call BIS_fnc_rscLayer) cutRsc ["I_HUD_NOTIFICATION", "PLAIN"];
((uiNameSpace getVariable "I_HUD_NOTIFICATION") displayCtrl 1500) ctrlSetText _text;

for "_i" from 0 to 2 do {
	playSound "FD_Timer_F";
	
	sleep 0.15;
};