/* clientSendServerMessage script
Created: 17/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Sends a CommVar message to the server, which is handled by "serverCommVarEH.sqf"
Params: [TypeName, [Params,in,array]] call MV_Client_fnc_SendServerMessage;
*/

private ['_tName', '_mParams','_msg'];
_tName = _this select 0;
_mParams = _this select 1;
_msg = '';

_msg = format ["[%1, %2]", str _tName, _mParams];

diag_log format ["MV: clientSendServerMessage: Message: %1", _msg];

call compile format ["%1_CommVar = %2;", Client_PlayerSlotStr, _msg];

publicVariableServer format ["%1_CommVar", Client_PlayerSlotStr];