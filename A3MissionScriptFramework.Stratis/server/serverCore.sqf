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

private ["_pFrame", "_runPrior"];

//
_runPrior = 1;
_pFrame = diag_frameno;

diag_log "MV: STARTING SERVER MAINLOOP";
while {true} do // This is the main loop. EVERYTHING serverside happens here.
{
    // -------- Run Priority 1 - Runs every frame --------
    
    
    
    // -------- Run Priority 2 - Runs every 2 frames --------
    if (_runPrior % 2 == 0) then
    {
        
    };
    
    // -------- Run Priority 4 - Runs every 4 frames --------
    if (_runPrior % 4 == 0) then
    {
		
    };
    
    // -------- Run Priority 8 - Runs every 8 frames --------
    if (_runPrior % 8 == 0) then
    {
		
    };
    
    // Leave this last.
    _runPrior = _runPrior + 1;
    if (_runPrior > PRIOR_RANGE) then {_runPrior = 1;};
    _pFrame = diag_frameno;
    waituntil {diag_frameno > _pFrame; sleep 0.01;}; // Main loop runs once per tick. Let the scheduler recycle
};