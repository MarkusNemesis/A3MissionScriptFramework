/* serverInitPlayerSlots script
Created: 14/09/2012
Author: Markus Davey
Skype: markus.davey
Desc: Initialises the player slots.
Stops the AI from moving / taking over.
Return: Null
*/
private ['_sLoc' ,"_players"];
_sLoc = (call M_S_fnc_GLV);
_players = (_sLoc getVariable "MV_Shared_PLAYERS_BLU") + (_sLoc getVariable "MV_Shared_PLAYERS_OP") + (_sLoc getVariable "MV_Shared_PLAYERS_IND") + (_sLoc getVariable "MV_Shared_PLAYERS_CIV");

{
    // -- Disable AI
    _x disableAI "FSM";
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x disableAI "MOVE";
    _x disableAI "ANIM";
    
    // -- Put player object into the spawn haven.
	_x setposASL getposASL Shared_SpawnHaven;
    _x enablesimulation false; 
	_x allowdamage false;
} forEach _players;