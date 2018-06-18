/*
	Author: Panda
	
	Description:
	Creates a crate which can be unpacked into a tent.
	
	Parameters:
	_this select 0: PositionATL
	_this select 1: STRING.
	
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

/*if (_tentPos isEqualTo []) exitWith {
	diag_log "I_fnc_createTent: no position provided.";
};*/

private ["_crateObject","_tentObject","_tentName"];

_crateObject = createVehicle ["CargoNet_01_box_F", _tentPos, [], 0, "CAN_COLLIDE"];
[_crateObject,true] call ace_dragging_fnc_setDraggable;

switch (_tentType) do {

	case "COMMAND": {
		_tentObject = createVehicle ["Land_tent_east", _tentPos, [], 0, "CAN_COLLIDE"];
		_tentObject hideObjectGlobal true;
		_tentObject allowDamage false;
		_tentObject attachTo[_crateObject,[0,0,1.3]];

		_tentName = "Command Tent";
	};

	case "MEDICAL": {
		_tentObject = createVehicle ["USMC_WarfareBFieldhHospital", _tentPos, [], 0, "CAN_COLLIDE"];
		_tentObject hideObjectGlobal true;
		_tentObject allowDamage false;
		_tentObject attachTo[_crateObject,[0,0,-1.831]];

		if ((["ace_main"] call I_fnc_isAddonActive) isEqualTo true) then {
			_tentObject setVariable ["ACE_isMedicalFacility",true,true];
		};

		_tentName = "Medical Tent";
	};

	case "SERVICE": {
		_tentObject = createVehicle ["CampEast_EP1", _tentPos, [], 0, "CAN_COLLIDE"];
		_tentObject hideObjectGlobal true;
		_tentObject allowDamage false;
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

[
	[_crateObject,_tentObject,_tentName],
{
	[
		(_this select 0),
		"Assemble Tent",
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

			_crateObject hideObjectGlobal true;
			_tentObject hideObjectGlobal false;

			["I_TENT_X", (getPos _crateObject), "hd_flag", "ColorWEST", (_this select 3 select 2)] call I_fnc_createMarkerIcon;
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
		"Pack Tent",
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

			_crateObject hideObjectGlobal false;
			_tentObject hideObjectGlobal true;

			deleteMarker "I_TENT_X";
		}, // Code executed on completion
		{},	// Code executed on interrupted
		[(_this select 0),(_this select 1)],
		2,
		0,
		false,
		false
	] call BIS_fnc_holdActionAdd;
}] remoteExec ["bis_fnc_call", 0,true]; 

_return