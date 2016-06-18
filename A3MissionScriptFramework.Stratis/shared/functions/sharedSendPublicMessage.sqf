/* sharedSendPublicMessage script
Created: 25/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Broadcasts information over the PublicMessageBroadcast public variable.  Format ["TypeName", [Array,Args,Etc]]
Params: ['_strType', '_arrArgs']
Example: ["AnimationEvent", [strNetID, strAnimation, strTransitionType]] call MV_Shared_fnc_SendPublicMessage;
*/

private ['_strType', '_arrArgs'];
_strType = _this select 0;
_arrArgs = _this select 1;

PublicMessageBroadcast = [_strType, _arrArgs];
diag_log format ["MV: sharedSendPublicMessage: %1", PublicMessageBroadcast];
publicVariable "PublicMessageBroadcast";

// -- If it's a client player, then run the event handler manually.
if (!isServer) then
{
	diag_log "Client is calling it's own PublicCommVarEH";
	_this call MV_Client_fnc_PublicCommVarEH;
};