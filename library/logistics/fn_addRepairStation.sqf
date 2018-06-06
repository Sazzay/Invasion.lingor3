/*
	Title: fn_addRepairDepot

	Author: Panda.

	Description: Creates a crate which can assemble into a repair depot..

	Parameter(s):
		0 (Required):
			ARRAY - The position to create the repair depot at.

		1 (Required)
			INT - The direction which the object faces.
	Returns:
		OBJECT.

	Example: 
		Example 1: [[7618.95,7536.73,0],90] call fnc_addRepairDepot;

	Notes:
	Do not touch this file.
*/
params
[
	["_depotPos",[],[[]]],
	["_depotDir",0,[0]]
];

private ["_repairDepot","_repairDepot2","_repairdepot_Marker"];

_repairDepot = createVehicle ["B_Slingload_01_Repair_F", _depotPos, [], 0, "CAN_COLLIDE"];
_repairDepot setDir _depotDir;
_repairDepot allowDamage false;
[_repairDepot, 10] remoteExecCall ["setMass", 0, true];

_repairDepot2 = createVehicle ["Land_RepairDepot_01_green_F", _depotPos, [], 0, "CAN_COLLIDE"];
_repairDepot2 setDir _depotDir;
_repairDepot2 attachTo [_repairDepot,[-0.5,0,1.1]];
_repairDepot2 allowDamage false;

{
	clearItemCargoGlobal 	 _x;
	clearWeaponCargoGlobal 	 _x;
	clearMagazineCargoGlobal _x;
	clearBackpackCargoGlobal _x;
}forEach [_repairDepot,_repairDepot2];

[_repairDepot, _repairDepot2] remoteExecCall ["disableCollisionWith", 0, true];

_repairDepot2 hideObjectGlobal true;

_repairDepot setVariable ["INVASION_DEPOT_DEPLOYED",false,true];
publicVariable "INVASION_DEPOT_DEPLOYED";

_repairdepot_Marker = format["repairdepot_%1",(random 99999)];

[_repairdepot_Marker,(getPos _repairDepot),"b_support","Default","Ground Vehicle Repair Depot - Inactive"] call framework_fnc_createMarkerIcon;

[_repairDepot,_repairdepot_Marker] spawn 
{
	while {true} do
	{
		sleep 1;
		(_this select 1) setMarkerPos (getPos (_this select 0));
	};
};

[_repairDepot,_repairDepot2,_repairdepot_Marker] spawn
{
	while {true} do
	{
		if (((_this select 0) getVariable "INVASION_DEPOT_DEPLOYED") isEqualTo false) then
		{
			_actionID = 
			[
				(_this select 0),
				"Assemble Repair Depot",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				"_this distance _target < 5",
				"_caller distance _target < 5",
				{}, // Executed on action start.
				{},	// Code executed on every progress tick						
				{
					(_this select 3 select 0) hideObjectGlobal true;

					(_this select 3 select 1) hideObjectGlobal false;

					(_this select 3 select 0) setVariable ["INVASION_DEPOT_DEPLOYED",true,true];

					(_this select 3 select 2) setMarkerText "Ground Vehicle Repair Depot - Active";

					[(_this select 3 select 0)] spawn 
					{
						while {(((_this select 0) getVariable "INVASION_DEPOT_DEPLOYED") isEqualTo true)} do
						{
							sleep 1;

							private _getVehicle = nearestObjects [(getPos (_this select 0)),["LandVehicle"],8];
							private _vehicle = (_getVehicle select 0);

							if (count _getVehicle > 0) then
							{
								if (alive _vehicle && isTouchingGround _vehicle) then
								{
									if (isEngineOn _vehicle isEqualTo false) then
									{
										_vehicleDamage 	= ((round ((damage _vehicle) * 100)) / 100);
										_vehicleFuel 	= ((round ((fuel _vehicle) * 100)) / 100);
										
										if (_vehicleDamage > 0) exitWith 
										{
											[format["The durability of this vehicle is at %1%2. Standby until 100%2 durability.",(100 - (_vehicleDamage * 100)),"%"]] remoteExec ["hint",(driver _vehicle),false];

											_vehicle setDamage (_vehicleDamage - 0.01);
										};

										if (_vehicleFuel < 1) exitWith 
										{
											[format["The fuel level of this vehicle is at %1%2. Standby until fuel levels are at 100%2.",(_vehicleFuel * 100),"%"]] remoteExec ["hint",(driver _vehicle),false];
											[_vehicle, _vehicleFuel + 0.01] remoteExec ["setFuel",0,true];
										};

										if ((count magazinesAllTurrets _vehicle) > 0) then
										{

											[_vehicle,1] remoteExec ["setVehicleAmmoDef",_vehicle,false];

											[format["Service complete.\nVehicle durability is at %1%2.\nVehicle fuel level is at %3%2.\nAmmunition has been loaded.",(100 - (_vehicleDamage * 100)),"%",(_vehicleFuel * 100)]] remoteExec ["hint",(driver _vehicle),false];

										}
										else
										{
											[format["Service complete.\nVehicle durability is at %1%2\nVehicle fuel level is at %3%2.",(100 - (_vehicleDamage * 100)),"%",(_vehicleFuel * 100)]] remoteExec ["hint",(driver _vehicle),false];
										};
									}
									else
									{
										["The engine must be switched off in order to service this vehicle."] remoteExec ["hint",(driver _vehicle),false];
									};
								};
							};
						};
					};
				}, // Code executed on completion
				{},	// Code executed on interrupted
				[(_this select 0),(_this select 1),(_this select 2)],
				6,
				0,
				true,
				false
			] call BIS_fnc_holdActionAdd;

			waitUntil 
			{
				((_this select 0) getVariable "INVASION_DEPOT_DEPLOYED") isEqualTo true;
			};

			[(_this select 0),_actionID] remoteExec ["BIS_fnc_holdActionRemove",0,true];
		}
		else
		{
			_actionID = 
			[
				(_this select 1),
				"Disassemble Repair Depot",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
				"_this distance _target < 5",
				"_caller distance _target < 5",
				{}, // Executed on action start.
				{},	// Code executed on every progress tick						
				{
					(_this select 3 select 0) hideObjectGlobal false;

					(_this select 3 select 1) hideObjectGlobal true;

					(_this select 3 select 0) setVariable ["INVASION_DEPOT_DEPLOYED",false,true];

					(_this select 3 select 2) setMarkerText "Ground Vehicle Repair Depot - Inactive";
				}, // Code executed on completion
				{},	// Code executed on interrupted
				[(_this select 0),(_this select 1),(_this select 2)],
				6,
				0,
				true,
				false
			] call BIS_fnc_holdActionAdd;

			waitUntil 
			{
				((_this select 0) getVariable "INVASION_DEPOT_DEPLOYED") isEqualTo false;
			};

			[(_this select 1),_actionID] remoteExec ["BIS_fnc_holdActionRemove",0,true]
		};
	};
};

_return = _repairDepot;
_return