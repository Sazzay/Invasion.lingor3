/*
	Title: fn_unitMarker

	Author: Panda

	Description: Adds markers to certain units, using getVariable.

	Parameter(s):
		0 (Required):
			OBJECT - Unit to apply tracking to.
		1 (Required):
			STRING - Icon of marker.
		2 (Required):
			STRING - Text of marker (usually name of unit or vehicle).
	Returns:
		Nothing.

	Example: 
		Example 1: [unit,"b_inf","Squad Leader"] spawn fnc_unitMarker;

	Notes:
	Do not touch this file.
*/
params
[
	["_unit",objNull,[objNull]],
	["_markerIcon","",[""]],
	["_markerText","",[""]]
];

private ["_markerID_Player","_markerID_Vehicle","_isUnconscious"];

if (_unit isKindOf "Man") then 
{
	_unit addEventHandler
	[
		"Respawn",
		"
			params ['_unit', '_corpse']; 
			[_unit,'" + _markerIcon + "','" + _markerText + "'] spawn framework_fnc_unitMarker;
		"
	];
};

_markerID_Player  = (name _unit);
_markerID_Vehicle = str (floor (random 9999999));

if (enable_UnitTracking isEqualTo true) then 
{
	while {alive _unit} do 
	{
		sleep 1;

		if (alive _unit) then
		{
	 		if (_unit isKindOf "Man") then 
			{
				if (getMarkerColor _markerID_Player isEqualTo "") then 
				{
					[_markerID_Player,(getPos _unit),_markerIcon,"Default",""] call framework_fnc_createMarkerIcon;
				};

				_isUnconscious = _unit getVariable ["ACE_isUnconscious",false];

				if (isNull ObjectParent _unit) then 
				{
					_markerID_Player setMarkerPos (getPos _unit);
					_markerID_Player setMarkerText (format["%1 %2",(groupID group _unit),_markerText]); 
					_markerID_Player setMarkerAlpha 1;

					if (_isUnconscious isEqualTo false) then 
					{
						_markerID_Player setMarkerColor "Default";
					}
					else
					{
						_markerID_Player setMarkerColor "ColorGrey";
					};
				}
			    else
			    {
			    	_markerID_Player setMarkerAlpha 0;
				};
			};

			if (_unit isKindOf "Car" || _unit isKindOf "Wheeled_APC_F" || _unit isKindOf "Tank" || _unit isKindOf "Air" || _unit isKindOf "UAV") then 
			{
				if (getMarkerColor _markerID_Vehicle isEqualTo "") then 
				{
					[_markerID_Vehicle,(getPos _unit),_markerIcon,"Default",""] call framework_fnc_createMarkerIcon;
				};

				_markerID_Vehicle setMarkerPos (getPos _unit); 
				
				if ((_unit getVariable "mhqVehicle") isEqualTo true) then
				{
					if ((_unit getVariable "mhqActive") isEqualTo true) then
					{
						_markerID_Vehicle setMarkerText (format["%1 - Active",_markerText]);
					}
					else
					{
						_markerID_Vehicle setMarkerText (format["%1 - Inactive",_markerText]);
					};
				}
				else
				{
					_markerID_Vehicle setMarkerText (format["%1",_markerText]);
				};

				if (canMove _unit isEqualTo true || (fuel _unit) > 0 ) then 
				{
					_markerID_Vehicle setMarkerColor "Default";
				}
				else
				{
					_markerID_Vehicle setMarkerColor "ColorGrey";
				};
			};
		}
		else
		{
			sleep 3;
			deleteMarker _markerID_Player;
			deleteMarker _markerID_Vehicle;
		};
	};
};