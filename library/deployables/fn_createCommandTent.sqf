/*
	Author: Panda
	
	Description:
	Creates a crate which can be unpacked into a tent.
	
	Parameters:
	_this select 0: PositionATL
	
	Returns:
	NOTHING.
	
	Example:
	_call = [[0,0,0]] call I_fnc_createCommandTent;
*/

params
[
	["_tentPos",[],[[]]]
];

/*if (_tentPos isEqualTo []) exitWith {
	diag_log "I_fnc_createTent: no position provided.";
};*/

private ["_crateObject","_tentObject"];

_crateObject = createVehicle ["CargoNet_01_box_F", _tentPos, [], 0, "CAN_COLLIDE"];

if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
	[_crateObject,true,[0,1.8,0]] remoteExecCall ["ace_dragging_fnc_setDraggable",0,true];
	[_crateObject, 5] remoteExecCall ["ace_cargo_fnc_setSize",0,true];
	_crateObject enableRopeAttach false;
};

["I_TENT_COMMAND_ACTIVE", [false, objNull]] call I_fnc_setVariable;

[
	[_crateObject],
	{
		[
			(_this select 0),
			"Assemble Command Tent",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
			"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
			"_this distance _target < 5",
			"_caller distance _target < 5 && (getPosATL _target select 2) < 1 && (surfaceIsWater (getPos _target)) isEqualTo false;",
			{}, // Executed on action start.
			{},	// Code executed on every progress tick						
			{
				private ["_crateObject","_nearestTents","_tentObject"];
				_crateObject = (_this select 3 select 0);
				_nearestTents = nearestObjects [_crateObject, ["Land_tent_east", "USMC_WarfareBFieldhHospital","CampEast_EP1"], 20];

				if (_nearestTents isEqualTo []) then {

					[_crateObject,true] remoteExec ["hideObject",0,true]; // hideobjectglobal isn't working on dedi from holdaction.

					_tentObject = createVehicle ["Land_tent_east", (getPos _crateObject), [], 0, "CAN_COLLIDE"];
					_tentObject attachTo[_crateObject,[0,0,1.3]];
					_tentObject allowDamage false;

					if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
						detach _crateObject; // stop fly glitch.
					};
					
					["I_TENT_COMMAND_ACTIVE", [true, _tentObject]] call I_fnc_setVariable;

					[format["I_TENT_%1",(str _tentObject)], (getPos _crateObject), "hd_flag", "ColorWEST","Command Tent"] call I_fnc_createMarkerIcon;

					[
						[_crateObject,_tentObject],
						{
							[
								(_this select 1),
								"Disassemble Command Tent",
								"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
								"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
								"_this distance _target < 5",
								"_caller distance _target < 5",
								{}, // Executed on action start.
								{},	// Code executed on every progress tick						
								{
									private ["_crateObject","_tentObject"];
									_crateObject = (_this select 3 select 0);
									_tentObject = (_this select 3 select 1);

									_medicalTentCheck = ["I_TENT_MEDICAL_ACTIVE", false] call I_fnc_getVariable;
									_engineerTentCheck = ["I_TENT_ENGINEER_ACTIVE", false] call I_fnc_getVariable;

									if (_medicalTentCheck isEqualTo false && _engineerTentCheck isEqualTo false) then {

										[_crateObject,false] remoteExec ["hideObject",0,true]; // hideobjectglobal isn't working on dedi from holdaction.

										if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
											detach _crateObject; // stop fly glitch.
										};

										["I_TENT_COMMAND_ACTIVE", [false, objNull]] call I_fnc_setVariable;

										deleteVehicle _tentObject;
										deleteMarker (format["I_TENT_%1",(str _tentObject)]);
									} else {
										["Unable to disassemble Command Tent; Please disassemble other tents."] call I_fnc_notification;
									};
								}, // Code executed on completion
								{},	// Code executed on interrupted
								[(_this select 0),(_this select 1)],
								2,
								0,
								false,
								false
							] call BIS_fnc_holdActionAdd;
						}
					] remoteExec ["bis_fnc_call",0,true];
				} else {
					["Unable to place Command Tent."] call I_fnc_notification;
				};
			}, // Code executed on completion
			{},	// Code executed on interrupted
			[(_this select 0)],
			2,
			0,
			false,
			false
		] call BIS_fnc_holdActionAdd;
	}
] remoteExec ["bis_fnc_call", 0,true];