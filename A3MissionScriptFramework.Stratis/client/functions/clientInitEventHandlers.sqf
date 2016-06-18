/* clientInitEventHandlers script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises all the event handlers that are run on the client.
Return:
*/

Client_KilledEH = player addEventHandler ["killed", {call MV_Client_fnc_KilledEH}];
Client_RespawnEH = player addEventHandler ["respawn", {call MV_Client_fnc_RespawnEH}];
Client_HitEH = player addEventHandler ["hit", {call MV_Client_fnc_HitEH}];
"PublicMessageBroadcast" addPublicVariableEventHandler {_this call MV_Client_fnc_PublicCommVarEH}; // Format: ["Type", [Array, Args]]