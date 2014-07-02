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

private ["_pFrame", "_runPrior"];

//
_runPrior = 1;
_pFrame = diag_frameno;

diag_log "MV: STARTING CLIENT MAINLOOP";
while {true} do // This is the main loop. EVERYTHING clientside happens here.
{
    // -------- Run Priority 1 - Runs every frame --------
    {
        private ['_fname', '_args', '_priority'];
        _fname = _x select 0;
        _args = _x select 1;
        _priority = _x select 2;
        call compile format ["_args call %1", _fname]; //_args call _fName;
        diag_log format ["Running event from array: %1 , %2", _fname, _args];
        [_forEachIndex] call MV_Client_fnc_RemoveEvent;
    } foreach Client_EventArray;
    
    // Check if the player is spawned
    if (Client_PlayerSpawned) then
    {
		
    };
    
    // -------- Run Priority 2 - Runs every 2 frames --------
    if (_runPrior % 2 == 0) then
    {
        
    };
    
    // -------- Run Priority 4 - Runs every 4 frames --------
    if (_runPrior % 4 == 0) then
    {
        // Run the garbage collector
        call MV_Client_fnc_RunGarbageCollector;
    };
    
    // -------- Run Priority 8 - Runs every 8 frames --------
    if (_runPrior % 8 == 0) then
    {
		
    };
    
    // Leave this last.
    _runPrior = _runPrior + 1;
    if (_runPrior > PRIOR_RANGE) then {_runPrior = 1;};
    _pFrame = diag_frameno;
    waituntil {diag_frameno > _pFrame; sleep 0.01;}; // Main loop runs once per tick.Let the scheduler recycle
};