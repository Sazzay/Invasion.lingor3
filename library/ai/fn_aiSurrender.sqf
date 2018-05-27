/*
	Author: Panda
	
	Description:
	Sets the target into a captive state, removes all weapons and plays an animation.
	
	Parameters:
	_this select 0: UNIT.
	_this select 1: BOOL.
	
	Returns:
	BOOL

	Example:
	_call = [cursorTarget,true] call I_fnc_aiSurrender;
*/
params
[
	["_unit",objNull,[objNull]],
	["_setCaptive",false,[false]]
];

switch (_setCaptive) do 
{
	case true:
	{
		_unit setCaptive true;
		_unit setVariable ["AI_SURRENDER",true,true];
		removeAllWeapons _unit;
		_unit playMove "AmovPercMstpSsurWnonDnon";
		_unit disableAI "autoTarget";
	};
	case false:
	{
		_unit setCaptive false;
		_unit setVariable ["AI_SURRENDER",false,true];
		_unit switchMove "";
		_unit enableAI "autoTarget";
	};
};

_functionReturn = (captive _unit);
_functionReturn