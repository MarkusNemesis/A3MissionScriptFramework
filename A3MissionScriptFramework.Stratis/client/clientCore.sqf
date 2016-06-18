/* clientCore script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: This is the script where the main loop of the client lives. This loop runs once per frame.
Events can have a priority setting. This setting dictates how many frames will pass between each event execution. 
Priorities are any number between 1-8. A priority of 1 will run once every frame. A priority of 4, will run every 4 frames. etc
This helps distribute functions across a spectrum of how often a function is ran. 
This can off-set non time-critical functions, and leave more room for other more important events.
*/

private [];

//

// -------- Run Priority 1 - Runs every frame --------
{
	if (!isnil '_x') then { // -- Somehow, this can happen....
		private ['_fname', '_args', '_eTime'];
		_fname = _x select 0;
		_args = _x select 1;
		_eTime = _x select 2;
		if (!isnil '_fname') then {
			if (_eTime < time) then { // -- Call only when it's ready to be.
				diag_log format ["MV: CLIENT: Running event from array: %1 , %2. Frame: %3, EventCount: %4", _fname, _args, diag_frameno, count Client_EventArray];
				[_forEachIndex] call MV_Client_fnc_RemoveEvent; // -- Removes before running, as, if it causes an error, the mainloop will reboot, and thankfully not catch the same bugged event and crash infinitely.
				call compile format ["_args call %1", _fname]; // Runs the event
			}; 
		} else { // -- Event is a null event, and thus removed.
			[_forEachIndex] call MV_Client_fnc_RemoveEvent;
		}; 
	};
} foreach Client_EventArray;

// Check if the player is spawned
if (Client_PlayerSpawned) then
{
	
};

// -------- Run Priority 2 - Runs every 2 frames --------
if (diag_frameno % 2 == 0) then
{
	
};

// -------- Run Priority 4 - Runs every 4 frames --------
if (diag_frameno % 4 == 0) then
{
	
};

// -------- Run Priority 8 - Runs every 8 frames --------
if (diag_frameno % 8 == 0) then
{
	
};

// -------- Run Priority Second - Runs every second --------
if ((call MV_Shared_fnc_GetServerTimeInt) > clientLastSecond) then
{
	
};