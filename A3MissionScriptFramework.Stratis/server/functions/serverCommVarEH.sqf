/* serverCommVarEH script
Created: 14/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: CommVars are semi-public variables defined by the server, where client <> server communication can take place.
Contains a switch that handles events. 
_tPlayer is the player that sent the message.
Format: ["eventType", [Params,array,etc]];
*/

private ['_lObj', '_tPlayer', '_vValue', '_eType', '_vParams'];
_lObj = (call M_S_fnc_GLV);
diag_log (_this select 0);
_tPlayer = (call compile (_this select 0));
_vValue = _this select 1;
_eType = _vValue select 0;
_vParams = _vValue select 1;
diag_log format ["MV: serverCommVarEH: %1", _this];

switch (_eType) do
{
	// -- Client is testing
	case "testmessage":
	{
		private ["_pObj"];
		_pObj = objectFromNetId (_vParams select 0);
		diag_log format ["Player %1 sent a message!",_pObj];
	};
    // -- Client is buying a vehicle
    // case "BuyVehicle":
    // {
        // private ['_sObj', '_vIndex', '_vCName', '_sArr', '_vPrice', '_sPos'];
        // _sObj = objectFromNetId (_vParams select 0);
        // _vIndex = _vParams select 1;
		// _sArr = [netId _sObj, "storeArray"] call MV_Server_fnc_GetMissionVariable;
        // _vCName = (_sArr select _vIndex) select 0;
        // _vPrice = [_vCName] call MV_Shared_fnc_VehicleGetPrice;
        // diag_log format ["MV: serverCommVarEH sending event: %1, %2, %3, %4", _vCName, _vPrice, _sObj, _tPlayer];
        // ['MV_Server_fnc_BuyVehicle', [_vCName, _vPrice, _sObj, _tPlayer]] call MV_Server_fnc_AddEvent;
        // diag_log Server_EventArray;
    // };
	
};




