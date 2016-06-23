/* ServerInit script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises all the systems required for the mission. Functions, variables, etc.
*/

private ["_runTime","_serverCore"];
_runTime =+ time;

diag_log "MV: SERVER INIT: STARTED";

// -- Create map location for serverside only variable storage. Variable name is created by random number generator. 
private ['_slocN', '_sLoc'];
_slocN = format ['%1%2', (profileName), round (random 10000)];
call compile format ["%1 = createLocation ['NameVillage', [0, 0, 0], 1, 1];", _slocN];
uiNamespace setVariable ["Server_LocObj", _slocN];
diag_log format ["MV: ServerInit: Location Var name generated: %1", _slocN];

// Init server functions
call compile preprocessFileLineNumbers "server\functions\serverInitFunctions.sqf";

// Initialize shared resources only if the server is dedicated. Otherwise the client and server will both init shared.
if (isDedicated) then {call compile preprocessFileLineNumbers "Shared\sharedInit.sqf";};
// Remove before flight
call compile preprocessFileLineNumbers "Shared\sharedInit.sqf";
//
// init Params
call MV_Shared_fnc_initParams;

// Init global variables
Server_PlayerRegistry = []; // Format: [id, playerName, UID, playerSlot];
Server_EventArray = []; // Server_EventArray elements contain: ["function_name", [args], priority]

// -- Init public variables
MV_Netvar_WESTVEHICLES = [];
publicVariable "MV_Netvar_WESTVEHICLES";
MV_Netvar_EASTVEHICLES = [];
publicVariable "MV_Netvar_EASTVEHICLES";

// OnPlayerConnected
OnPlayerConnected "[_id, _name, _uid] execVM ""Server\functions\serverOnPlayerConnected.sqf"";";

// OnPlayerDisconnected
OnPlayerDisconnected "[_id, _name, _uid] execVM ""Server\functions\serverOnPlayerDisconnected.sqf"";";

// -------- CODE AFTER THIS POINT IS RAN DURING MISSION TIME --------
waituntil {time > 0;}; // Checks if the mission has actually started.

// Create spawn haven
private ["_vName", "_object"];
_object = "Land_Cargo_HQ_V1_F" createvehicle [100, 100, 100]; 
_object setposASL [-1000, -1000, 0];
_object allowdamage false;
Shared_SpawnHaven = _object;
["SpawnhavenInit",[netID _object]] call MV_Shared_fnc_SendPublicMessage;


// Init playerslots
call MV_Shared_fnc_GetPlayers;
call MV_Server_fnc_initPlayerSlots;

// -- Spawn HQs and starting vehicles at spawn points.
call MV_Server_fnc_SpawnStartingVehicles;

// YOU MUST Leave this last. This calls the serverCore mainloop.
_runTime = time - _runTime;
diag_log format ["MV: server INIT: FINISHED, Time taken: %1", _runTime];

diag_log "MV: STARTING SERVER MAINLOOP";
_serverCore = compile preprocessFileLineNumbers "server\serverCore.sqf";

serverLastSecond = call MV_Shared_fnc_GetServerTimeInt;
["serverCoreID", "onEachFrame", {
	call _this;
},_serverCore] call BIS_fnc_addStackedEventHandler;