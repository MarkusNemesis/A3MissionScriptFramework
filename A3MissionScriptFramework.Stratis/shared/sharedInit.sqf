/* sharedInit script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises all things that are shared between the client and server namespaces.
*/

private ["_runTime"];
_runTime =+ time;

// Init shared constant variables
call compile preprocessFileLineNumbers "shared\sharedConstants.sqf";

// Init shared functions
call compile preprocessFileLineNumbers "shared\functions\sharedInitFunctions.sqf";

// leave last
_runTime = time - _runTime;
diag_log format ["MV: shared INIT: FINISHED, Time taken: %1", _runTime];