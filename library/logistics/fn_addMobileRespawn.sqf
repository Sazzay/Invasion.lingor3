/*
	Title: fn_addMobileRespawn

	Author: Panda && Markus "Sazzay" Larsson.

	Description: Creates a mobile respawn point on the designated vehicle.

	Parameter(s):
		0 (Required):
			OBJECT - The object to place the respawn position on.

	Returns:
		Nothing.

	Example: 
		Example 1: [vehicle] call fn_addMobileRespawn;

	Notes:
	Do not touch this file.
*/
params
[
	["_respawnObject",objNull,[objNull]]
];
private ["_isRespawnActive","_loopActive","_marker"];
_isRespawnActive = [];
_loopActive = true;

if (_respawnObject isKindOf "LandVehicle" || _respawnObject isKindOf "Helicopter") then
{
	_marker = [format ["RP_%1", (str _respawnObject)], (getPos _respawnObject), "respawn_motor", "ColorWEST", "Mobile HQ - Inactive"] call I_fnc_createMarkerIcon;

	while {_loopActive isEqualTo true} do 
	{
		_marker setMarkerPos (getPos _respawnObject);
		
		if (isTouchingGround _respawnObject isEqualTo true && (isEngineOn _respawnObject) isEqualTo false && count _isRespawnActive < 1 && _respawnObject distance usmc_lhd > 1800) then 
		{ 
			_isRespawnActive = [west, (_respawnObject modelToWorld [-3, 2, (getPos _respawnObject select 2)]), "Mobile Deployment"] call BIS_fnc_addRespawnPosition;
			_marker setMarkerText "Mobile HQ - Active";
		};

		if (count _isRespawnActive > 0 && _respawnObject distance usmc_lhd < 1800 && isTouchingGround _respawnObject isEqualTo false || (isEngineOn _respawnObject) isEqualTo true) then 
		{ 
			_isRespawnActive call BIS_fnc_removeRespawnPosition;
			_isRespawnActive = [];
			_marker setMarkerText "Mobile HQ - Inactive";
		};

		if (!alive _respawnObject) exitWith 
		{
			_isRespawnActive call BIS_fnc_removeRespawnPosition;
			_isRespawnActive = nil;
			_loopActive = false;

			deleteMarker _marker;
		};

		sleep 1;
	};
}
else
{
	["fn_addMobileRespawn does not support this class type. It currently only supports all land vehicles, and helicopters."] call BIS_fnc_error;
};
