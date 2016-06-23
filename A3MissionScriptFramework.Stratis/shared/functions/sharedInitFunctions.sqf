/* sharedInitFunctions script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Precompiles functions and makes them available. They are not restricted and can be called on both server and client.
*/

MV_Shared_fnc_initParams = Compilefinal preprocessFileLineNumbers "shared\functions\sharedInitParams.sqf";
MV_Shared_fnc_GetPlayers = Compilefinal preprocessFileLineNumbers "shared\functions\sharedGetPlayers.sqf";
MV_Shared_fnc_SetSuperAI = Compilefinal preprocessFileLineNumbers "shared\functions\sharedSetSuperAI.sqf";
MV_Shared_fnc_GetServerTimeInt = Compilefinal preprocessFileLineNumbers "shared\functions\sharedGetServerTimeInt.sqf";
MV_Shared_fnc_SendPublicMessage = Compilefinal preprocessFileLineNumbers "shared\functions\sharedSendPublicMessage.sqf";
MV_Shared_fnc_getRandomPosition = Compilefinal preprocessFileLineNumbers "shared\functions\sharedGetRandomPosition.sqf";