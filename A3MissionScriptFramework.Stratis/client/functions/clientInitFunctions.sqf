/* clientInitFunctions script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: declares and compiles all the client specific functions.
Return:
*/

MV_Client_fnc_AddEvent = Compile preprocessFile "client\functions\clientAddEvent.sqf";
MV_Client_fnc_RemoveEvent = Compile preprocessFile "client\functions\clientRemoveEvent.sqf";
MV_Client_fnc_SpawnPlayer = Compile preprocessFile "client\functions\clientSpawnPlayer.sqf";
MV_Client_fnc_AddGarbage = Compile preprocessFile "client\functions\clientAddGarbage.sqf";
MV_Client_fnc_AddDeathObject = Compile preprocessFile "client\functions\clientAddDeathObject.sqf";
MV_Client_fnc_InitEventHandlers = Compile preprocessFile "client\functions\clientInitEventHandlers.sqf";
MV_Client_fnc_KilledEH = Compile preprocessFile "client\functions\clientKilledEH.sqf";
MV_Client_fnc_RespawnEH = Compile preprocessFile "client\functions\clientRespawnEH.sqf";
MV_Client_fnc_HitEH = Compile preprocessFile "client\functions\clientHitEH.sqf";
MV_Client_fnc_RunGarbageCollector = Compile preprocessFile "client\functions\clientRunGarbageCollector.sqf";
MV_Client_fnc_KillMessage = Compile preprocessFile "client\functions\clientKillMessage.sqf";

// MV_Client_fnc_ = Compile preprocessFile "client\functions\client.sqf";