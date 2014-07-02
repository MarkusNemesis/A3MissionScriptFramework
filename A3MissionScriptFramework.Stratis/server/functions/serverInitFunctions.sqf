/* serverInitFunctions script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Precompiles functions and makes them available. There are restricted to the serverside scope.
*/

MV_Server_fnc_initPlayerSlots = Compile preprocessFile "Server\functions\ServerInitPlayerSlots.sqf";
MV_Server_fnc_OnPlayerConnected = Compile preprocessFile "Server\functions\serverOnPlayerConnected.sqf";
MV_Server_fnc_OnPlayerDisconnected = Compile preprocessFile "Server\functions\serverOnPlayerDisconnected.sqf";