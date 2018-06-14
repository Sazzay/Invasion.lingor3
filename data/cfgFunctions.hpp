class I
{
	class restrictions
	{
		file = "library\restrictions";
		class vehicularEligibility;
		class timedBool;
		class setVariable;
		class getVariable;
		class isAddonActive;
	};
	class visual
	{
		file = "library\visual";
		class notification;
		class progressBar;
		class progressBarFade;
	};
	class objects
	{
		file = "library\objects";
		class createVehicle;
		class createGroup;
		class createGroupEfficient;
		class createCrewedVehicle;
		class createTaskGroup;
		class findPlayers;
		class populateTown;
		class populateTask;
		class deleteObjects;
		class returnGroupsFromArray;
		class spawnRandomAA;
	};
	class acs
	{
		file = "library\acs";
		class findHostileForce;
		class findHostileBoatPatrol;
		class findHostileAir;
	};
	class positional
	{
		file = "library\positional";
		class findNearestWater;
		class findAAPos;
		class findEmptyLine;
		class findEmptyWaterLine;
		class findEmptyNoRoads;
		class findAmbushLocation;
		class findTowns;
		class findAirports;
		class findNearestPos;
		class findFarthestPos;
		class findTaskPos;
		class findArtilleryPos;
	};
	class ai
	{
		file = "library\ai";
		class taskGroupAssault;
		class taskGroupAmbush;
		class aiSkill;
		class deleteInactive;
	};
	class arrays
	{
		file = "library\arrays";
		class deleteElement;
	};
	
	class logistics
	{
		file = "library\logistics";
		class addMobileRespawn;
		class addRepairStation;
		class createAmmoCrate;
		class serviceVehicle;
	};
	class support
	{
		file = "library\support";
		class paraAssaultSquadron;
		class artilleryPlatoon;
	};
	class debug
	{
		file = "library\debug";
		class hintStrEastGroups;
	};
};
