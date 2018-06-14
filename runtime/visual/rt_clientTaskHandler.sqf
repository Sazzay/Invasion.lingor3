/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	This script initially populates the map with tasks, according to their type, and then it continously checks whetever or not a task or town is captured
	and then it removes the task from the map.
*/

waitUntil {!((GLOBAL getVariable "ADS_TASK_ALLOBJECTS") isEqualTo [])};

[[] call I_fnc_findTowns, (GLOBAL getVariable "ADS_TASK_ALLOBJECTS")] params ["_towns", "_tasks"];

{
	["NIL", "attack", (nearestLocations [_x, ["NameCity", "NameCityCapital", "NameVillage"], 500, _x])] params ["_name", "_icon", "_locations"];

	_name = text (_locations select 0);
	
	if ((type (_locations select 0)) isEqualTo "NameCityCapital") then {
		_icon = "City"
	};
	if (((type (_locations select 0)) isEqualTo "NameCity") or ((type (_locations select 0)) isEqualTo "NameVillage")) then {
		_icon = "Town"
	};

	[player, format ["TOWN_TASK_%1", [_x select 0, _x select 1]], ["", format ["Capture %1", _name], ""], _x, "CREATED", 1, false, _icon, false] call BIS_fnc_taskCreate;
} forEach _towns;

{
	["NIL", ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliett", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "Xray", "Yankee", "Zulu"]] params ["_name", "_array"];
	
	[player, format ["OBJECTIVE_TASK_%1", _x], ["", format ["Destroy %1", (_array select _forEachIndex)], ""], _x, "CREATED", 1, false, ((_array select _forEachIndex) select [0, 1]), false] call BIS_fnc_taskCreate;
} forEach _tasks;

while {true} do {
	{
		[(format ["OBJECTIVE_TASK_%1", _x])] params ["_task"];
	
		if (!(alive _x) and !([_task] call BIS_fnc_taskCompleted)) then {
			[_task, "SUCCEEDED", true] call BIS_fnc_taskSetState;
		};
	} forEach _tasks;
	
	{
		[(GLOBAL getVariable [format ["ADS_TOWN_%1_CAP", [_x select 0, _x select 1]], 0]), (format ["TOWN_TASK_%1", [_x select 0, _x select 1]])] params ["_var", "_task"];
		
		if (((round _var) >= 21) and !([_task] call BIS_fnc_taskCompleted)) then {
			[_task, "SUCCEEDED", true] call BIS_fnc_taskSetState;
		};
	} forEach _towns;

	sleep 2.5;
};