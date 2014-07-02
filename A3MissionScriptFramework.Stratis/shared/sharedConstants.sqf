/* sharedInit script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Initialises variables that are shared between the client and server namespaces.
*/

private ["_runTime", "_i"];
_runTime =+ time;

// Constants
PRIOR_RANGE = 8; // Dictates the valid ranges of event priorities

// Player slots
MV_Shared_PLAYERS_BLU = [];
MV_Shared_PLAYERS_OP = [];
MV_Shared_PLAYERS_IND = [];
MV_Shared_PLAYERS_CIV = [];

// leave last
_runTime = time - _runTime;
diag_log format ["MV: sharedConstants INIT: FINISHED, Time taken: %1", _runTime];