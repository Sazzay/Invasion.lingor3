/*
	Author: Panda
	
	Description:
	Creates a crate which can be unpacked into a tent.
	
	Parameters:
	_this select 0: PositionATL
	_this select 1: STRING
	
	Returns:
	OBJECT
	
	Example:
	_call = [[0,0,0],"MEDICAL"] call I_fnc_createTent;
*/

params
[
	["_tentPos",[],[[]]],
	["_tentType","",[""]]
];

if (_tentPos isEqualTo []) exitWith {
	diag_log "I_fnc_createTent: no position provided.";
};

/*

	ADD RESTRICTIONS.

*/

private ["_crateObject","_tentObject","_tentName","_supportedTypes"];

_crateObject = createVehicle ["CargoNet_01_box_F", _tentPos, [], 0, "CAN_COLLIDE"];

if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
	[_crateObject,true,[0,1.8,0]] remoteExecCall ["ace_dragging_fnc_setDraggable",0,true];
	[_crateObject, 5] remoteExecCall ["ace_cargo_fnc_setSize",0,true];
	_crateObject enableRopeAttach false;
};

switch (_tentType) do {

	case "COMMAND": {
		_tentObject = createVehicle ["Land_tent_east", _tentPos, [], 0, "CAN_COLLIDE"];
		_tentObject attachTo[_crateObject,[0,0,1.3]];

		_tentName = "Command Tent";
	};

	case "MEDICAL": {
		_tentObject = createVehicle ["USMC_WarfareBFieldhHospital", _tentPos, [], 0, "CAN_COLLIDE"];
		_tentObject attachTo[_crateObject,[0,0,-1.831]];

		if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
			_tentObject setVariable ["ACE_isMedicalFacility",true,true];
		};

		_tentName = "Medical Tent";
	};

	case "SERVICE": {
		_tentObject = createVehicle ["CampEast_EP1", _tentPos, [], 0, "CAN_COLLIDE"];
		_tentObject attachTo[_crateObject,[0,0,0.7]];

		[_tentObject] call I_fnc_serviceVehicle;

		if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
			_tentObject setVariable ["ACE_isRepairFacility",true,true];
		};

		_tentName = "Engineering Tent";
	};

	default {
		diag_log "I_fnc_createTent: invalid tent type. Only supports 'COMMAND', 'MEDICAL' and 'SERVICE'";
	};
};

_tentObject hideObjectGlobal true;
_tentObject allowDamage false;

[
	[_crateObject,_tentObject,_tentName],
{
	[
		(_this select 0),
		(format["Assemble %1",(_this select 2)]),
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
		"_this distance _target < 5",
		"_caller distance _target < 5 && (getPosATL _target select 2) < 1 && (surfaceIsWater (getPos _target)) isEqualTo false;",
		{}, // Executed on action start.
		{},	// Code executed on every progress tick						
		{
			private ["_crateObject","_tentObject","_nearestTents","_findTents"];
			_crateObject = (_this select 3 select 0);
			_tentObject = (_this select 3 select 1);

			_nearestTents = nearestObjects [_crateObject, ["Land_tent_east", "USMC_WarfareBFieldhHospital","CampEast_EP1"], 20];
			_findTents = [_tentObject,_nearestTents] call I_fnc_deleteElement;

			if (_findTents isEqualTo []) then {

				[_crateObject,true] remoteExec ["hideObject",0,true]; // hideobjectglobal isn't working on dedi from holdaction.
				[_tentObject,false] remoteExec ["hideObject",0,true]; // hideobjectglobal isn't working on dedi from holdaction.

				[format["I_TENT_%1",(str _tentObject)], (getPos _crateObject), "hd_flag", "ColorWEST", (_this select 3 select 2)] call I_fnc_createMarkerIcon;
			} else {
				["Cannot assemble; Another tent is within 20 meters."] call I_fnc_notification;
			};
		}, // Code executed on completion
		{},	// Code executed on interrupted
		[(_this select 0),(_this select 1),(_this select 2)],
		2,
		0,
		false,
		false
	] call BIS_fnc_holdActionAdd;

	[
		(_this select 1),
		(format["Pack %1",(_this select 2)]),
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

			[_crateObject,false] remoteExec ["hideObject",0,true]; // hideobjectglobal isn't working on dedi from holdaction.
			[_tentObject,true] remoteExec ["hideObject",0,true]; // hideobjectglobal isn't working on dedi from holdaction.

			deleteMarker (format["I_TENT_%1",(str _tentObject)]);
		}, // Code executed on completion
		{},	// Code executed on interrupted
		[(_this select 0),(_this select 1)],
		2,
		0,
		false,
		false
	] call BIS_fnc_holdActionAdd;
}] remoteExec ["bis_fnc_call", 0,true]; 

_return = _crateObject;
_return
