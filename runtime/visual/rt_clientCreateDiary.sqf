/*
	Create diary for information and description of systems/features.
*/

player createDiaryRecord ["Diary", ["Information", 
"Report bugs and leave feedback to discord tag <font color='#ffab1a'>ocd#0644</font> or <font color='#ffab1a'>Panda#8990</font><br/><br/>

Admins have access to debug console and Zeus, if needed they can assist if something breaks or a bug is found.<br/><br/>

All air vehicles are located on deck, all land vehicles are located middle deck and there are also patrol boats at the 
bottom of the boat. The mission relies heavily on pilots so make sure you have some, otherwise dealing with armor
will be very difficult.<br/><br/>

Special note related to rearming vehicles, there is not yet any vehicle rearm crates, so temporarily there is a rearm
vehicle (the APC infront of the MHQ truck) that can be airlifted onto land to rearm armored vehicles.<br/><br/>

If you have any questions, don't hesitate to ask either <font color='#ffab1a'>Ocd</font> or <font color='#ffab1a'>Panda</font> through whatever medium you prefer.
"]];

player createDiaryRecord ["Diary", ["Logistic System", 
"Report bugs and leave feedback to discord tag <font color='#ffab1a'>ocd#0644</font> or <font color='#ffab1a'>Panda#8990</font><br/><br/>

In the current build of this mission, the logistics system is fairly simple. Sling-loading is available to all air vehicles, and you are able to drag and load 
the supply crates into the back of choppers. Currently, each crate is worth 5 cargo space and can be air-dropped using ACE interaction.<br/><br/>

The logistics system curruently features:<br/>

(1) Multiple respawn options:<br/>
<font color='#ffab1a'>Rally Point</font> - Placable by squad leaders, usable by group. Can be seen on the map via marker.<br/>
<font color='#ffab1a'>MHQ</font> - Can airlift and drive it. Vehicle must be stationary and engine must be off in order to active the respawn. Can be seen on the map via marker.<br/><br/>

(2) Vehicle Servicing:<br/>
<font color='#ffab1a'>Vehicle Service Pad</font> - A service pad is available on the <marker name ='I_USMC_LHD_FLAG'>LHD</marker> by default.<br/><br/>

(3) A tent system, all tent types are listed below:<br/>
<font color='#ffab1a'>Command</font> - Currently has no functionality.<br/>
<font color='#ffab1a'>Medical</font> - Provides a training boost to both medics and regular soldiers.<br/>
<font color='#ffab1a'>Engineer</font> - Provides a training boost to engineers.<br/>

This system will be expanded upon throughout updates, to create a fully player-dependable logistics system.<br/>
Please note that, not all helicopters will be able to sling load, as each vehicle has a weight limit. Crates are not slingloadable if ACE is enabled, and training boosts
do not happen if ACE is not enabled.
"]];

player createDiaryRecord ["Diary", ["Callsigns & Radio Frequency", 
"Report bugs and leave feedback to discord tag <font color='#ffab1a'>ocd#0644</font> or <font color='#ffab1a'>Panda#8990</font><br/><br/>

<font color='#ffab1a'>Reaper 1-1, Infantry</font>:<br/>
SR: <font color='#ffab1a'>30</font> Default, <font color='#ffab1a'>30</font>-<font color='#ffab1a'>35</font> range.<br/><br/>

<font color='#ffab1a'>Erebus 1-1, Recon</font>:<br/>
SR: <font color='#ffab1a'>40</font> Default, <font color='#ffab1a'>40</font>-<font color='#ffab1a'>41</font> range.<br/><br/>

<font color='#ffab1a'>Kratos 1-1, Anti-Tank Support</font>:<br/>
SR: <font color='#ffab1a'>50</font> Default, <font color='#ffab1a'>50</font>-<font color='#ffab1a'>51</font> range.<br/><br/>

<font color='#ffab1a'>Ares 1-1, Vehicle Support</font>:<br/>
SR: <font color='#ffab1a'>60</font> Default, <font color='#ffab1a'>60</font>-<font color='#ffab1a'>61</font> range.<br/><br/>

<font color='#ffab1a'>Ares 1-2, Vehicle Support</font>:<br/>
SR: <font color='#ffab1a'>62</font> Default, <font color='#ffab1a'>62</font>-<font color='#ffab1a'>63</font> range.<br/><br/>

<font color='#ffab1a'>Ares 1-3, Vehicle Support</font>:<br/>
SR: <font color='#ffab1a'>64</font> Default, <font color='#ffab1a'>64</font>-<font color='#ffab1a'>65</font> range.<br/><br/>

<font color='#ffab1a'>Pegasus 1-1, Rotor Support</font>:<br/>
SR: <font color='#ffab1a'>66</font> Default, <font color='#ffab1a'>66</font>-<font color='#ffab1a'>67</font> range.<br/><br/>

<font color='#ffab1a'>Pegasus 1-2, Rotor Support</font>:<br/>
SR: <font color='#ffab1a'>68</font> Default, <font color='#ffab1a'>68</font>-<font color='#ffab1a'>69</font> range.<br/><br/>

<font color='#ffab1a'>Apocalypse 1-1, Fixed-wing Support</font>:<br/>
LR: <font color='#ffab1a'>81</font> Default.<br/><br/>

<font color='#ffab1a'>Apocalypse 1-2, Fixed-wing Support</font>:<br/>
LR: <font color='#ffab1a'>81</font> Default.<br/><br/>

<font color='#ffab1a'>Intersquad Communication</font>:<br/>
LR: <font color='#ffab1a'>70</font> Default.<br/><br/>
Used by ground infantry, rotor aircraft and armor to communicate with eachother. It is ideal that all units make use of task force radios' seperate multi-channel functionality. (Use numpad or open up the radio and change channel.)<br/><br/>

<font color='#ffab1a'>Support Communication</font>:<br/>
LR: <font color='#ffab1a'>80</font> Default.<br/><br/>
Used by ground infantry to request support from air & vehicle support. It is ideal that all units make use of task force radios' seperate multi-channel functionality. (Use numpad or open up the radio and change channel.)<br/><br/>
"]];

/*
	Diary Records for each update Build.
*/
player createDiaryRecord ["Diary", ["Build 6", 
"Report bugs and leave feedback to discord tag <font color='#ffab1a'>ocd#0644</font> or <font color='#ffab1a'>Panda#8990</font><br/><br/>

New Features:<br/>
<font color='#ffab1a'>(1)</font> Marker added to MHQ system. The MHQ will now display whether it's active or inactive, and it's location on the map.<br/>
<font color='#ffab1a'>(2)</font> The LHD now has an outline on the map screen.<br/>
<font color='#ffab1a'>(3)</font> Supply crates and Tent crates can now be dragged and loaded, if ace is enabled.<br/>
<font color='#ffab1a'>(4)</font> Basic tent system has been added.<br/>
<font color='#ffab1a'>(5)</font> Loadouts have been revamped. Medics, Engineers and EOD tech should have their class appropriate items.<br/><br/>

Tweaked Features:<br/>
<font color='#ffab1a'>(1)</font> Nothing.<br/><br/>

Fixed Bugs:<br/>
<font color='#ffab1a'>(1)</font> Nothing.

Known Bugs:<br/>
<font color='#ffab1a'>(1)</font> Nothing.
"]];
