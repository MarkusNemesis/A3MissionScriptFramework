/* serverInitFunctions script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Precompiles functions and makes them available. There are restricted to the serverside scope.
*/

MV_Server_fnc_initPlayerSlots = Compile preprocessFile "Server\functions\ServerInitPlayerSlots.sqf";
MV_Server_fnc_OnPlayerConnected = Compile preprocessFile "Server\functions\serverOnPlayerConnected.sqf";
MV_Server_fnc_OnPlayerDisconnected = Compile preprocessFile "Server\functions\serverOnPlayerDisconnected.sqf";
MV_Server_fnc_SendClientMessage = Compile preprocessFileLineNumbers "Server\functions\serverSendClientMessage.sqf";

// -- Garbage Collector - garbageCollector
MV_Server_fnc_AddGarbage = Compile preprocessFileLineNumbers "server\functions\garbageCollector\serverAddGarbage.sqf";
MV_Server_fnc_RunGarbageCollector = Compile preprocessFileLineNumbers "Server\functions\garbageCollector\serverRunGarbageCollector.sqf";
MV_Server_fnc_UpdateGarbageObject = Compile preprocessFileLineNumbers "Server\functions\garbageCollector\serverUpdateGarbageObject.sqf";
MV_Server_fnc_DeleteWorldObject = Compile preprocessFileLineNumbers "Server\functions\garbageCollector\serverDeleteWorldObject.sqf";
MV_Server_fnc_DeleteGarbageCollectionEntry = Compile preprocessFileLineNumbers "Server\functions\garbageCollector\serverDeleteGarbageCollectionEntry.sqf";

// -- Event Array Handling
MV_Server_fnc_AddEvent = Compile preprocessFileLineNumbers "Server\functions\serverAddEvent.sqf";
MV_Server_fnc_RemoveEvent = Compile preprocessFileLineNumbers "Server\functions\serverRemoveEvent.sqf";

// -- Get/Set Server variables
MV_Server_fnc_SetMissionVariable = Compile preprocessFileLineNumbers "Server\functions\missionVariables\serverSetMissionVariable.sqf";
MV_Server_fnc_GetMissionVariable = Compile preprocessFileLineNumbers "Server\functions\missionVariables\serverGetMissionVariable.sqf";
M_S_fnc_GLV = Compile preprocessFileLineNumbers "Server\functions\missionVariables\serverGetLocVar.sqf";
MV_Server_fnc_RemoveObjectMissionVariableArray = Compile preprocessFileLineNumbers "Server\functions\missionVariables\serverRemoveObjectMissionVariableArray.sqf";

// -- Event Handlers
MV_Server_fnc_CommVarEH = Compile preprocessFileLineNumbers "Server\functions\serverCommVarEH.sqf";

// MV_Server_fnc_ = Compile preprocessFile "server\functions\server .sqf";