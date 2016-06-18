/* sharedGetPlayers script
Created: 01/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Gets the player slots and stores them.
*/

private ['_lObj', '_players_blu', '_players_op', '_players_ind', '_players_civ', '_bpc', '_opc', '_ipc', '_cpc', '_aReturn'];

if (isServer) then 
{
	_lObj = (call M_S_fnc_GLV);
} else {
	_lObj = (call M_C_fnc_GLV);
};

_players_blu = [];
_players_op = [];
_players_ind = [];
_players_civ = [];
_bpc = (_lObj getVariable "BLU_PLAYERCOUNT");
_opc = (_lObj getVariable "OP_PLAYERCOUNT");
_ipc = (_lObj getVariable "IND_PLAYERCOUNT");
_cpc = (_lObj getVariable "CIV_PLAYERCOUNT");
// Get them from semi-static arrays instead....
if (_bpc > 0) then {
	for "_i" from 1 to _bpc do
	{
	    _players_blu set [count _players_blu, call compile format ["BLU_P_%1", _i]];
	};
};

if (_opc > 0) then {
	for "_i" from 1 to _opc do
	{
	    _players_op set [count _players_op, call compile format ["OP_P_%1", _i]];
	};
};
//_players_ind
if (_ipc > 0) then {
	for "_i" from 1 to _ipc do
	{
	    _players_ind set [count _players_ind, call compile format ["IND_P_%1", _i]];
	};
};

//_players_civ
if (_cpc > 0) then {
	for "_i" from 1 to _cpc do
	{
	    _players_civ set [count _players_civ, call compile format ["CIV_P_%1", _i]];
	};
};


private ['_sLoc'];
if (isServer) then 
{
	_sLoc = call M_S_fnc_GLV;
} else {
	_sLoc = call M_C_fnc_GLV;
};

_sLoc setVariable ["MV_Shared_PLAYERS_BLU", _players_blu];
_sLoc setVariable ["MV_Shared_PLAYERS_OP", _players_op];
_sLoc setVariable ["MV_Shared_PLAYERS_IND", _players_ind];
_sLoc setVariable ["MV_Shared_PLAYERS_CIV", _players_civ];

_aReturn = _players_blu + _players_op + _players_ind + _players_civ;

_aReturn