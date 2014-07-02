/* serverOnPlayerConnected script
Created: 09/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Runs when a player connects to the server. Stores their name, slotname, etc.
*/
private ['_id','_name','_uid', '_slotName'];
_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;
_slotName = "";
diag_log format ["onPlayerConnected: %1, %2, %3", _id, _name, _uid];

// Ensure player name __SERVER__ is ignored.
if (_name == "__SERVER__") exitwith {};

// Find the player's slot name.
{
    if (_name == name _x) exitwith {_slotname = str _x};
} foreach MV_Shared_PLAYERS_BLU + MV_Shared_PLAYERS_OP + MV_Shared_PLAYERS_IND + MV_Shared_PLAYERS_CIV;

//Add player to the Server_PlayerRegistry
Server_PlayerRegistry set [count Server_PlayerRegistry, [_id, _name, _uid, _slotname]];