/*
	Title: fn_createMarkerShape

	Author: Panda

	Description: Simplifies marker creation to one line, using parameters. This is the local shape types version.

	Parameter(s):
		0 (Required):
			STRING - Marker ID; Used to identify the marker and make adjustments later on.

		1 (Required):
			ARRAY - Marker Position; The position of the marker in array format.

		2 (Required):
			STRING - Marker Shape; Shape can be "RECTANGLE", "ELLIPSE" or "POLYLINE".

		3 (Required):
			STRING - Marker Brush; https://community.bistudio.com/wiki/setMarkerBrush

		4 (Required):
			STRING - Marker Color; Choose a desired color for the marker, visit https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3 for color types.

		5 (Required):
			ARRAY - Size in array format; [a-axis,b-axis];

		6 (Optional):
			INT - Marker Direction; Changes the markers pointing direction.

	Returns:
		STRING - Created marker.

	Example: 
		Example 1: ["respawn_west",(position player),"RECTANGLE","Grid,"ColorBlack",[50,50]] call fnc_createMarkerShapeLocal;

	Notes:
	Do not touch this file.
*/

params
[
	["_markerID","",[""]],
	["_markerPos",[0,0,0],[[]]],
	["_markerShape","RECTANGLE",[""]],
	["_markerBrush","Grid",[""]],
	["_markerColor","ColorBlack",[""]],
	["_markerSize",[],[[]]],
	["_markerDir",0,[0]]
];

_marker = 	createMarkerLocal [_markerID, _markerPos];
_marker 	setMarkerShapeLocal _markerShape;
_marker 	setMarkerBrushLocal _markerBrush;
_marker 	setMarkerColorLocal _markerColor;
_marker 	setMarkerSizeLocal _markerSize;
_marker 	setMarkerDirLocal _markerDir;

_functionReturn = _marker;

_functionReturn