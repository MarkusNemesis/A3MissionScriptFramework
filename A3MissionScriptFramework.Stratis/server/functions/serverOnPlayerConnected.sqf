/* serverOnPlayerConnected script
Created: 09/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Runs when a player connects to the server. Stores their name, slotname, etc.
*/

//
private ['_lObj', '_playersArray', '_id','_name','_uid', '_slotName', '_retryCount', '_pObj'];
_lObj = (call M_S_fnc_GLV);
_playersArray = (call MV_Shared_fnc_GetPlayers);
_id = _this select 0;
_name = _this select 1;
_uid = _this select 2;
_slotName = "";
_pObj = objnull;
diag_log format ["MV: serverOnPlayerConnected: %1, %2, %3", _id, _name, _uid];

// ---- Ensure player name __SERVER__ is ignored.
if (_name == "__SERVER__") exitwith {};

//call MV_Shared_fnc_GetPlayers;

// ---- Find the player's slot name.
_retryCount = 0;
while {_slotname == "" && _retryCount < 30} do
{
	{
	    if ((getPlayerUID _x) == _uid) exitwith {_slotname = str _x; _pObj = _x};
	} foreach _playersArray;
    _retryCount = _retryCount + 1;
    sleep 0.5;
	_playersArray = (call MV_Shared_fnc_GetPlayers);
};
if (_slotname == "") exitwith {diag_log format ["MV: serverOnPlayerConnected: CRITICAL ERROR: %1, %2, %3 FAILED TO GET SLOT", _id, _name, _uid];};

// -- Init Player CommVar
private ['_commVarStr'];
_commVarStr = format ["%1_CommVar", _slotName];
call compile format ["%1 = []; '%1' addPublicVariableEventHandler {['%2', _this select 1] call MV_Server_fnc_CommVarEH;};", _commVarStr, _slotName];
diag_log format ["PublicVar set: %1", _commVarStr];

// ---- Check if the player has played before in this session. iterate through Server_PlayerRegistry
private ['_found', '_prIndex'];
_found = false;
_prIndex = -1;

{
    diag_log format ["%1 vs %2, %3 vs %4", _uid, _x select 2, _name, _x select 1];
    if (_uid == (_x select 2)) exitwith {_found = true;_prIndex = _foreachindex};
} foreach Server_PlayerRegistry;

if (!_found) then // -- If the player has connected for the first time this round
{
    diag_log format ["MV: serverOnPlayerConnected: Player %1 has joined for the first time. UID: %2", _name, _uid];
	// ---- Add player to the Server_PlayerRegistry
	Server_PlayerRegistry set [count Server_PlayerRegistry, [_id, _name, _uid, _slotname]];
	// -- Init the player's _lObj array.
	_lObj setVariable [format ["%1_missionVar", _uid], []];
	// -- Init first time joiner
    //_pObj setVariable ["Money", MV_Params_GPStartFunds, true];
	
    // -- Serverside values
	//[_uid, ["Money", [MV_Params_GPStartFunds]]] call MV_Server_fnc_SetMissionVariable;
	
	// [_uid, ["BankMoney", [0]]] call MV_Server_fnc_SetMissionVariable;
	// [_uid, ["KeyChain", []]] call MV_Server_fnc_SetMissionVariable;
	// [_uid, ["storageVolume", [(_lObj getVariable "MV_Shared_PLAYERVOLUME")]]] call MV_Server_fnc_SetMissionVariable;
	
	/*
	[_uid, []] call MV_Server_fnc_SetMissionVariable;
	['UID', ['arrayType', [content,array,etc]];
	*/
}
else // -- otherwise, they've been here before, so lets pick them back up where they left off.
{
    diag_log format ["MV: serverOnPlayerConnected: Player %1 has returned. UID: %2", _name, _uid];
	// -- Update player registry slotname
	Server_PlayerRegistry set [_prIndex, [_id, _name, _uid, _slotname]];
	
	// TODO set player's inventory as blank in both missionvar and setvariable
	// _pObj setVariable ["Inventory", ([_uid, "Inventory"] call MV_Server_fnc_GetMissionVariable), true]; // DEBUG loads player inventory, even though it should be clear. For testing.
    // _pObj setVariable ["BankMoney", ([_uid, "BankMoney"] call MV_Server_fnc_GetMissionVariable) select 0, true];
    // _pObj setVariable ["KeyChain", [_uid, "KeyChain"] call MV_Server_fnc_GetMissionVariable, true];
    
	// [_uid, "ArrayType"] call MV_Server_fnc_GetMissionVariable
};
// -- Init player's inventory as empty. They've joined so thus have lost whatever they had before.

// -- Set public object variables
// _pObj setVariable ['isInteractable', true, true];
// _pObj setVariable ['interactType', 'typePlayer', true];
// _pObj setVariable ['isStunned', false, true];
// _pObj setVariable ['isRestrained', [false], true];
//
// [_uid, ["isInteractable", [true]]] call MV_Server_fnc_SetMissionVariable;
// [_uid, ["interactType", ['typePlayer']]] call MV_Server_fnc_SetMissionVariable;
// [_uid, ["isStunned", [false]]] call MV_Server_fnc_SetMissionVariable;
// [_uid, ["isRestrained", [false]]] call MV_Server_fnc_SetMissionVariable;

//
_pObj enablesimulation true; 
_pObj allowdamage true;

_pObj setVariable ["clientInitCompleteAck", true, true]; // Acknowledges to the client that it is inited on both client and server.
