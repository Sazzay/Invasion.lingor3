# Invasion.lingor3

Another ARMA 3 semi-dynamic mission, inspired greatly by previous works like domination or insurgency. The idea of this mission is that USMC
is conducting an island invasion of (as a first map of choice) Lingor. The composition of main objectives will be different each restart but 
typically it involves:
- Capture of towns as the main progressive goal towards victory.
- Capture of vital locations, like airfields, bases and other strategic locations that are randomized per restart.
- Destruction of resources, like ammo caches, anti-air installations, vehicle depots and more.

There will also be smaller missions to conduct in varying difficulties, examples may be:
- Rescue operations.
- VIP recovery and takedown.

All of the above represents the players offensive objectives. But the AI has objectives of their own, their objective is to repel the players
(your) invasion. They do this by enacting their own counter-offensive towards the player at varying intervals, meaning the player will always
have to stay alert, and is not always at the mercy of farming the objectives. The AI has 3 initial system under a branch I call ACS short for
Active Combat System, these are:
- Counter to air, dynamic Anti-Aircraft spawns. These vary between AA manpads to Tunguskas.
- Counter to sea, dynamic river ambushes. These will typically be infantry ambushing along the river up ahead of the players.
- Counter to land, dynamic persistent land attacks. Motorized, mechanized and air response to players conducting land operations in larger
groups. This can be anything from a BTR-80A to full blown MI-8 paratrooper assault squads.

Done:
- ACS (Air)
- ACS (Sea)
- ACS (Land)
- ADS (Towns)
- ADS (Tasks)
- AI Support (MI-8 Air Assault Squad ie. paratroopers)

Todo:
- AI Support (Artillery)
- AI Convoys
- All clientside stuff remains

Suggestions:
- Sattelite Pictures for SM's

Expanded description (6/3/2018) of Invasion:

Active Combat System - Anti Air: This part of the ACS spawns anti air units which are either Infantry AA, Ural ZU-23 or a faster mover. The fast mover (for eg. MiG-29) can only spawn if you are flying a AV-8B or another type of plane.

Active Combat System - Sea: This part of ACS spawns one full squad of MSV or VDV infantry to wait until the patrol boat in the river is close enough, and then it attacks that boat. This to ensure that no travel path onto a russian occupied island is overlooked, as a river approach is more subtle.

Active Combat System - Land: This part of ACS spawns up anywhere from 1 to 6 squads (usually, by this I mean it's a percentage chance to spawn in), these squads are MSV or VDV infantry that may be accompanied by BMP's, BTR's or BMD's. This is the most deadly part of ACS as they counter air units and land infantry.

Active Defense System - Towns: This part of ADS populates a town with OPFOR infantry, armor and watch towers along with one HQ building. It also has a capture variable where if you, the player, is within 100 meters starts capturing (however as of 6/3/2018 no clientside display for this is added yet). This is the main victory condition, if enough towns are destroyed, the mission is won.

Active Defense System - Tasks: This part of ADS creates a few objects spread around the map. These objects contribute to more wave intensity for ACS, that is to say if there is 6 barracks spawned in it means that as an example, in ACS Land it goes 700 - random 150 + random 150 - barracks * 30 where 6 would replace barracks, this effectively means that if the whole map is filled with barracks from ADS Tasks it would reduce the respawn time between ACS Land waves by 18 * 20 = 360, so at a lowest count it could be as close as 190 seconds between attack waves. And if these objects are destroyed, you reduce the difficulty that way, by reducing the spawn intensity.

AI Support System - MI-8 Air Assault Squad: As the name suggests, this script checks whenever a unit dies and at a percentage chance it has a chance to call in MI-8 paratroopers (up to 4 helicopters filled with paratrooper infantry). This is also interfaced with the tasks to reduce the intensity of reinforcements depending on active task objects.

AI Support System - Artillery (WIP): This script will work in the same manner as MI-8 Air Assault Squad script does, except instead of paratroopers it spawns artillery within a certain distance and then proceeds to bombard the area that the instigators (the general area of the person who killed the opfor unit is).

That's it for the major system and what is ready and/or very close to being ready. We still have work to do on all the clientside stuff and we have a few other systems related to airports and base capture needing to be considered for the serverside. Other then that you will have the general stuff that most other missions offer: Rally points & we have MHQ's implemented are examples.

For roles available in the mission goes as follows:
24x Operators (MARSOC), 2 groups: Main difference between any of these units are Team Leader and Element Leaders, where IIRC Team Leader controls the whole squad of 12 and the Element Leader controls a fireteam (half the squad). We plan on making some kind of load out system for this where kits can be picked by anyone but is limited in number (think Squad loadouts, sort of).
4x Pilots & Co-Pilots: Pilots and Co-Pilots for controlling the UH-1Y's, AH-1Z's and CH-53E's.
2x AV-8B Pilots: As the name suggests, this is for the harrier pilots.
9x Crewmen: These crewmen range from Commander, Gunner to Driver. All of these will be required to operate a vehicle effectively.

For vehicles we have the following:
2x AV-8B Harriers
2x UH-1Y Transport Helicopters
1x CH-53E Heavy Transport & Airlift (required to transport some vehicles to land)
2x Stryker MGS
2x M1129 Stryker (mortar stryker)
Undecided amount of: HMVWW's, LAV-25's and other amphibious vehicles.
And a MHQ truck.

