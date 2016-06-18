/* clientInit script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises all the systems required for the client. Functions, variables, etc.
*/

private ["_runTime","_clientCore"];
_runTime =+ time;
// Enter into a loading screen. This forces all processing power towards scripts.
startLoadingScreen ["Receiving"];
//
waitUntil {!isNull player}; // Make sure the player exists before starting.
diag_log "MV: CLIENT INIT: STARTED";

// -- Create map location for clientside only variable storage. Variable name is created by random number generator. 
private ['_slocN', '_sLoc'];
_slocN = format ['%1%2', (profileName), (round (random 10000))];
call compile format ["%1 = createLocation ['NameVillage', [0, 0, 0], 1, 1];", _slocN];
uiNamespace setVariable ["Client_LocObj", _slocN];
diag_log format ["MV: clientInit: Location Var name generated: %1", _slocN];

// Init client functions
call compile preprocessFileLineNumbers "Client\functions\clientInitFunctions.sqf";

// Initialize shared resources
call compile preprocessFileLineNumbers "Shared\sharedInit.sqf";

// Client constants
Client_PlayerName = str name player;
Client_PlayerSide = side player;
Client_PlayerSideStr = str Client_PlayerSide;
Client_PlayerSlotStr = str player;
//
// Init client globals
Client_SpawnType = "first";
Client_PlayerSpawned = false;
Client_HitArray = []; // Stores all the 'hits' the player receives and is collated on player death and sent to the server the top 3 damage sources by %.
Client_EventArray = []; // Client_EventArray elements contain: ["function_name", [args], priority] 

// Declare client's commVar
call compile format ["%1_CommVar = '';", Client_PlayerSlotStr];
format ["%1_CommVar", Client_PlayerSlotStr] addPublicVariableEventHandler {[_this select 1] call MV_Client_fnc_CommVarEH};
// SERVER FETCHED VARIABLES ->
// All network fetched variables are initialized here. This should be done as late as possible.
//waitUntil{!isnil 'MV_Netvar_VARNAME'};
// <- SERVER FETCHED VARIABLES

setViewDistance 2000;

// init Params
call MV_Shared_fnc_initParams;

// Init Event handlers
call MV_Client_fnc_InitEventHandlers;

// **** CODE AFTER THIS POINT IS RAN DURING MISSION TIME ****
endLoadingScreen; // End loading screen
waituntil {time > 0}; // Checks if the mission has actually started.
finishMissionInit;

//

call MV_Shared_fnc_GetPlayers; // Gets the player names.

// Create player spawn event
["MV_Client_fnc_SpawnPlayer", [], 1] call MV_Client_fnc_AddEvent; 
// call MV_Client_fnc_SpawnPlayer;
// YOU MUST Leave this last. This calls the clientCore mainloop.
_runTime = time - _runTime;
diag_log format ["MV: CLIENT INIT: FINISHED, Time taken: %1", _runTime];


diag_log "MV: STARTING CLIENT MAINLOOP";
_clientCore = compile preprocessFileLineNumbers "Client\clientCore.sqf";

clientLastSecond = call MV_Shared_fnc_GetServerTimeInt;
["clientCoreID", "onEachFrame", {
	call _this;
},_clientCore] call BIS_fnc_addStackedEventHandler;