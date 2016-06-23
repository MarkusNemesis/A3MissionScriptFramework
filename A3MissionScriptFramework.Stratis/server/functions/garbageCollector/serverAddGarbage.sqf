/* serverAddGarbage script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Adds objects to the garbage collection array. These objects are cleared after the delay time has elapsed.
Return:
*/
private ['_garbage', '_delay'];

_garbage = _this;

{
    _delay = time;
	if (damage _x >= 1) then {
		_delay = _delay + (60* MV_Params_GCDelayCorpses); // -- If dead.
	} else {
	    _delay = _delay + (60* MV_Params_GCDelayVehicles); // -- If alive.
	};
    Server_GarbageCollection set [count Server_GarbageCollection, [_x, _delay]];
    diag_log format ["MV: Server: Garbage added to collector: %1, %2", _x, _delay];
} foreach _garbage;
