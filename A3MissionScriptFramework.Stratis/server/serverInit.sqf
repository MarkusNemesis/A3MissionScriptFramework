/* ServerInit script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises all the systems required for the mission. Functions, variables, etc.
*/

private ["_runTime"];
_runTime =+ time;

diag_log "MV: SERVER INIT: STARTED";

// Init server functions
call compile preprocessFileLineNumbers "server\functions\serverInitFunctions.sqf";

// Initialize shared resources only if the server is dedicated. Otherwise the client and server will both init shared.
if (isDedicated) then {call compile preprocessFileLineNumbers "Shared\sharedInit.sqf";};

// init Params
call MV_Shared_fnc_initParams;

// Init global variables
Server_PlayerRegistry = []; // Format: [id, playerName, UID, playerSlot];

// OnPlayerConnected
OnPlayerConnected "[_id, _name, _uid] execVM MV_Server_fnc_OnPlayerConnected;";

// OnPlayerDisconnected
OnPlayerDisconnected "[_id, _name, _uid] execVM MV_Server_fnc_OnPlayerDisconnected;";

// -------- CODE AFTER THIS POINT IS RAN DURING MISSION TIME --------
waituntil {time > 0;sleep 0.01;}; // Checks if the mission has actually started.


// Init playerslots
call MV_Shared_fnc_GetPlayers;
[MV_Shared_PLAYERS_BLU + MV_Shared_PLAYERS_OP + MV_Shared_PLAYERS_IND + MV_Shared_PLAYERS_CIV] call MV_Server_fnc_initPlayerSlots;

// YOU MUST Leave this last. This calls the serverCore mainloop.
_runTime = time - _runTime;
diag_log format ["MV: server INIT: FINISHED, Time taken: %1", _runTime];
call compile preprocessFileLineNumbers "server\serverCore.sqf";