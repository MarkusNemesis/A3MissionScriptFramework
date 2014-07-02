/* clientAddGarbage script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Adds objects to the garbage collection array for this client. These objects are cleared after the delay time has elapsed.
Return:
*/

private ['_garbage', '_delay'];

_garbage = _this;
_delay = time + (60* 2); // 2 minutes

{
    Client_PlayerGarbageCollection set [count Client_PlayerGarbageCollection, [_x, _delay]];
} foreach _garbage;

// TODO: communicate to the server the objects that are to be cleared, in the event of the client being disconnected.