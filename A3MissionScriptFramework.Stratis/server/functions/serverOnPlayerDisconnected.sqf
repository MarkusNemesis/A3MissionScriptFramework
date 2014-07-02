/* serverOnPlayerDisconnected script
Created: 06/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Tidies up the now disconnected client's mess.
*/

private ['_id','_name','_uid', '_slotName', '_vehicle'];
_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;
_slot = objnull;

// Fetch player's slot from the Server_PlayerRegistry
{
    if ((_id == _x select 0) && (_name == _x select 1)) exitwith {call compile format ["_slot = %1", _x select 1]};
} foreach Server_PlayerRegistry

// Run cleanup code below