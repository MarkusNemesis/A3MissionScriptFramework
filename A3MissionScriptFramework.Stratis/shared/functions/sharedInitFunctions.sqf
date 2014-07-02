/* sharedInitFunctions script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Precompiles functions and makes them available. They are not restricted and can be called on both server and client.
*/

MV_Shared_fnc_initParams = Compile preprocessFile "shared\functions\sharedInitParams.sqf";
MV_Shared_fnc_GetPlayers = Compile preprocessFile "shared\functions\sharedGetPlayers.sqf";
MV_Shared_fnc_SetSuperAI = Compile preprocessFile "shared\functions\sharedSetSuperAI.sqf";