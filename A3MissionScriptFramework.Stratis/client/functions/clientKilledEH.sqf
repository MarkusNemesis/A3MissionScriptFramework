/* clientKilledEH script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Runs when the player is killed.
*/

// -- Add body to the garbage collector
["AddGarbage", [netID player]] call MV_Client_fnc_SendServerMessage;