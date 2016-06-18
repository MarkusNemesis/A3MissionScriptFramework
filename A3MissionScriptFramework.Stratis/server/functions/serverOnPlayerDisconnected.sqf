/* serverOnPlayerDisconnected script
Created: 06/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Tidies up the now disconnected client's mess.
*/
diag_log format ["MV: serverOnPlayerDisconnected: %1", _this];
private ['_id','_name','_uid', '_slotName', '_vehicle'];
_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;
_slot = objnull;

// Fetch player's slot from the Server_PlayerRegistry
diag_log Server_PlayerRegistry;
{
    if (_id == _x select 0) exitwith {call compile format ["_slot = %1", _x select 3]};
} foreach Server_PlayerRegistry;

if (isNull _slot) exitwith {diag_log format ["MV: serverOnPlayerDisconnected: ERROR: %1's slot has not been found!", _name]};

// Run cleanup code below
waituntil {alive _slot};
_slot setposASL getposASL Shared_SpawnHaven;
// -- Disable object simulation.
_slot enableSimulation false; 
_slot allowDamage false;
