/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	The specified areas are searched for nearby vehicles, and if conditions are met, it will start to service the vehicle in
	question.
*/

[[[6841.24, 10095, 30]]] params ["_positions"];

while {true} do {
	{
		[(nearestObjects [_x, ["LandVehicle", "Air"], 20, false])] params ["_objects"];
	
		if !(_objects isEqualTo []) then {
			{
				[(_x getVariable "I_SERVICE_COOLDOWN")] params [["_cooldown", false]];
			
				if (_cooldown isEqualTo false) then {
					[_x] call I_fnc_serviceVehicle;
					
					[_x] spawn {
						(_this select 0) setVariable ["I_SERVICE_COOLDOWN", true];
						
						{
							["Vehicle is being serviced."] remoteExec ["I_fnc_notification", _x, false];
						} forEach (crew (_this select 0));
						
						for "_i" from 0 to ((100 - ((fuel (_this select 0)) * 100)) + ((damage (_this select 0)) * 100)) do {
							(_this select 0) engineOn false;
							sleep 0.2;
						};
						
						{
							["Vehicle has been serviced."] remoteExec ["I_fnc_notification", _x, false];
						} forEach (crew (_this select 0));
						
						sleep 30;
						
						(_this select 0) setVariable ["I_SERVICE_COOLDOWN", false];
					};
				};
			} forEach _objects;
		};
	} forEach _positions;
	
	sleep 2.5;
};