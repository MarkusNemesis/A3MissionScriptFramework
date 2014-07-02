/* clientRespawnEH script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Runs when the player respawns. Adds the 'respawn' event to the clientCore events array.
*/

// Clear variables for the respawn.
Client_HitArray = [];

// Leave last
["MV_Client_fnc_SpawnPlayer", [], 1] call MV_Client_fnc_AddEvent;
