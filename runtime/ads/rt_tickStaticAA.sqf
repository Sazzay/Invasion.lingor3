/*
	Author: Markus "Sazzay" Larsson
	
	Description:
	Adds static AA emplacements across the map, but not to close to eachother.
*/

[([4, 0.1] call I_fnc_findCompositionPos), []] params ["_array", "_units"];

{
	if ((nearestObjects [_x, [I_DEF_STATIC_AA], 2000, false]) isEqualTo []) then {
		[((createGroup [EAST, true]) createUnit ["rhs_vmf_recon_officer_armored", _x, [], 0, "NONE"]), (createVehicle [I_DEF_STATIC_AA, [(_x select 0) - 0.5, (_x select 1) + 1, (_x select 2)], [], 0, "CAN_COLLIDE"])] params ["_unit", "_veh"];
		[_x, I_DEF_COMPOSITIONS_STATIC_AA] call I_fnc_spawnComposition;
		
		_unit assignAsGunner _veh;
		_unit moveInGunner _veh;
		_unit setSkill 1;
		_units pushBack _unit;
		
		_unit addEventHandler ["FiredMan", {
			params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
			
			{
				_x disableCollisionWith _projectile;
			} forEach (nearestObjects [_projectile, ["Static"], 5]);
		}];
	};
} forEach _array;

{
	[{
		[(missionNamespace getVariable [format ["ADS_STATIC_AA_%1_ACTIVE", (_this select 0)], true]), ([getPos (_this select 0), 2500] call I_fnc_findPlayers)] params ["_var", "_players"];
	
		if (_var isEqualTo false) then {
			if ((count _players) >= 1) then {
				[format ["ADS_STATIC_AA_%1_ACTIVE", (_this select 0)], true] call I_fnc_setVariable;
				(_this select 0) enableSimulationGlobal true;
				
				{
					if ((vehicle _x) isKindOf "Air") then {
						(_this select 0) reveal [_x, 4];
					};
				} forEach _players;
				
				diag_log format ["ADS_STATIC_AA_%1_ACTIVE: Players in range of AA, unit is now simulated.", (_this select 0)];
			};
		} else {
			if ((count _players) <= 0) then {
				[format ["ADS_STATIC_AA_%1_ACTIVE", (_this select 0)], false] call I_fnc_setVariable;
				(_this select 0) enableSimulationGlobal false;
				
				diag_log format ["ADS_STATIC_AA_%1_ACTIVE: Players in range of AA, unit is no longer simulated.", (_this select 0)];
			};
		};
	
	}, 3, _x] call CBA_fnc_addPerFrameHandler;
} forEach _units;