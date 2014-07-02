/* serverInitPlayerSlots script
Created: 14/09/2012
Author: Markus Davey
Skype: markus.davey
Desc: Initialises the player slots.
Stops the AI from moving / taking over.
Return: Null
*/
private ["_players"];

_players = _this select 0;

{
    // Disable AI
    _x disableAI "FSM";
    _x disableAI "TARGET";
    _x disableAI "AUTOTARGET";
    _x disableAI "MOVE";
    _x disableAI "ANIM";
} forEach _players;

