/* serverUpdateGarbageObject script
Created: 17/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Updates the object's deletion delay to maximum time. Used for when people get in and out of vehicles, or interact with them.
If an object is dead, it's timer will be set to 2 minutes.
Units are also updated if they're destroyed.
*/

// Server_GarbageCollection

private ['_uObj', '_delay'];
_uObj = _this select 0;
_delay = time;

if (_uObj iskindof "Man") exitwith {}; // -- We don't update creatures/people as they're only added when they're dead.
//diag_log format ["GCUpdate unit: %1", _x];
if (damage _uObj >= 1) then 
{
    _delay = _delay + 60*MV_Params_GCDelayVehicles; // Object is dead.
}
else
{
    _delay = _delay + 60*30; // Object isn't dead.
};


// Leave last
{
    if (_uObj == _x select 0) exitwith {_x set [1, _delay]; diag_log format ["MV: GarbageUpdate: %1 updated", _uObj]; }; // Sets the delay for this object to whatever was decided above.
} foreach Server_GarbageCollection;