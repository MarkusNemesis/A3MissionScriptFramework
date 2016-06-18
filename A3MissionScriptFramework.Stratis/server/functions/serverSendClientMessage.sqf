/* serverSendClientMessage script
Created: 18/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Sends a message to a specific client.
[player, "command", [array,of,args]] call MV_Server_fnc_SendClientMessage;
*/

private ['_pObj','_tName', '_mParams','_msg', '_cID'];
_pObj = _this select 0;
_tName = _this select 1;
_mParams = _this select 2;
_msg = '';
_cID = owner _pObj;

_msg = format ["[%1, %2]", str _tName, _mParams];

diag_log format ["MV: serverSendClientMessage: Message: %1", _msg];

call compile format ["%1_CommVar = %2;", _pObj, _msg];

_cID publicVariableClient format ["%1_CommVar", _pObj];