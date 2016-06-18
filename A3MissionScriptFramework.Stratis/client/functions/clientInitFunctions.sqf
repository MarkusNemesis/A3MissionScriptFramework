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
MV_Client_fnc_KillMessage = Compile preprocessFile "client\functions\clientKillMessage.sqf";
MV_Client_fnc_SendServerMessage = Compile preprocessFileLineNumbers "client\functions\clientSendServerMessage.sqf";

// Variables handling
MV_Client_fnc_SetMissionVariable = Compile preprocessFileLineNumbers "client\functions\clientVariables\clientSetMissionVariable.sqf";
MV_Client_fnc_GetMissionVariable = Compile preprocessFileLineNumbers "client\functions\clientVariables\clientGetMissionVariable.sqf";
M_C_fnc_GLV = Compile preprocessFileLineNumbers "client\functions\clientVariables\clientGetLocVar.sqf";

// Event Handlers
MV_Client_fnc_InitEventHandlers = Compile preprocessFile "client\functions\clientInitEventHandlers.sqf";
MV_Client_fnc_KilledEH = Compile preprocessFile "client\functions\clientKilledEH.sqf";
MV_Client_fnc_RespawnEH = Compile preprocessFile "client\functions\clientRespawnEH.sqf";
MV_Client_fnc_HitEH = Compile preprocessFile "client\functions\clientHitEH.sqf";
MV_Client_fnc_CommVarEH = Compile preprocessFileLineNumbers "client\functions\clientCommVarEH.sqf";
MV_Client_fnc_PublicCommVarEH = Compile preprocessFileLineNumbers "client\functions\clientPublicCommVarEH.sqf";

// MV_Client_fnc_ = Compile preprocessFile "client\functions\client .sqf";