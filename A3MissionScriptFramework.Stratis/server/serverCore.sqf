/* serverCore script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: This is the script where the main loop of the server lives. This loop runs once per frame.
Events can have a priority setting. This setting dictates how many frames will pass between each event execution. 
Priorities are any number between 1-8. A priority of 1 will run once every frame. A priority of 4, will run every 4 frames. etc
This helps distribute functions across a spectrum of how often a function is ran. 
This can off-set non time-critical functions, and leave more room for other more important events.
*/

private [];

//

//

// -------- Run Priority 1 - Runs every frame --------
if (PreviousFrame < (diag_frameno - 2)) then
{
	diag_log "Error! Frame skip!";
};
PreviousFrame = diag_frameno;

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
if ((call MV_Shared_fnc_GetServerTimeInt) > serverLastSecond) then
{
	serverLastSecond = call MV_Shared_fnc_GetServerTimeInt;
	diag_log format["Server Test %1", serverLastSecond];
};