/* sharedGetPlayers script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Gets the player slots and stores them.
*/

// Get player objects.
_i = 1;

while {!isnil format  ["BLU_P_%1", _i]} do
{
    MV_Shared_PLAYERS_BLU set [count MV_Shared_PLAYERS_BLU, vehicle call compile format ["BLU_P_%1", _i]];
    _i = _i + 1;
};

_i = 1;
while {!isnil format  ["OP_P_%1", _i]} do
{
    MV_Shared_PLAYERS_OP set [count MV_Shared_PLAYERS_OP, vehicle call compile format ["OP_P_%1", _i]];
    _i = _i + 1;
};

//MV_Shared_PLAYERS_IND
_i = 1;
while {!isnil format  ["IND_P_%1", _i]} do
{
    MV_Shared_PLAYERS_IND set [count MV_Shared_PLAYERS_IND, vehicle call compile format ["IND_P_%1", _i]];
    _i = _i + 1;
};

//MV_Shared_PLAYERS_CIV
_i = 1;
while {!isnil format  ["CIV_P_%1", _i]} do
{
    MV_Shared_PLAYERS_CIV set [count MV_Shared_PLAYERS_CIV, vehicle call compile format ["CIV_P_%1", _i]];
    _i = _i + 1;
};