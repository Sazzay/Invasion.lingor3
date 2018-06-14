/*
	Title: fn_createMarkerIcon

	Author: Panda

	Description: Simplifies marker creation to one line, using parameters. This is the Icon types version.

	Parameter(s):
		0 (Required):
			STRING - Marker ID; Used to identify the marker and make adjustments later on.

		1 (Required):
			ARRAY - Marker Position; The position of the marker in array format.

		2 (Optional):
			STRING - Marker Icon; Visit cfgMarkers or the wikipedia to see the different types of icons available. https://community.bistudio.com/wiki/cfgMarkers (Default: "Empty").

		3 (Optional):
			STRING - Marker Color; Choose a desired color for the marker, visit https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3 for color types. (Default: "ColorBlack").

		4 (Optional):
			STRING - Marker Text; Sets the desired text onto the marker.
			
		5 (Optional):
			INT - Marker Direction; Changes the markers pointing direction.
	Returns:
		STRING - Created marker.

	Example: 
		Example 1: ["respawn_west",(position player),"Empty","ColorBlack",""] call fnc_createMarkerIcon;

	Notes:
	Do not touch this file.
*/

params
[
	["_markerID","",[""]],
	["_markerPos",[0,0,0],[[]]],
	["_markerType","Empty",[""]],
	["_markerColor","ColorBlack",[""]],
	["_markerText","",[""]],
	["_markerDir",0,[0]]
];

_marker = 	createMarker [_markerID, _markerPos];
_marker 	setMarkerType _markerType;
_marker 	setMarkerColor _markerColor;
_marker 	setMarkerText _markerText;
_marker 	setMarkerDir _markerDir;

_functionReturn = _marker;

_functionReturn