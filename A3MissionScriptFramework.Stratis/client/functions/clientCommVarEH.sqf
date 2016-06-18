/* clientCommVarEH script
Created: 18/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Triggered when a message is sent to this client's commVar.
*/

private ['_vValue', '_eType', '_vParams'];
_vValue = _this select 0;
_eType = _vValue select 0;
_vParams = _vValue select 1;
diag_log format ["MV: clientCommVarEH: %1", _vValue];

switch (_eType) do
{
	// case "BuyVehicleReturn":
    // {
        // private ['_pSuccess', '_eType'];
        // _pSuccess = _vParams select 0;
        // if (!_pSuccess) then {
            // _eType = _vParams select 1; // -- Either 'stock' or 'funds'
            // ["Server", format [localize "STR_MV_INT_ERRORBUYVEHICLE", _eType]] spawn MV_Client_fnc_int_MessageBox;
        // } else {
            // // -- Purchase was successful, hint to the client.
            // hint localize "STR_MV_INT_VEHPURCHASESUCCESS";
            // Client_VehicleBuyCooldown = time + 10; // -- Add 10 second cooldown for buying vehicles.
			// ["AnimationEvent", [netID player, ((["MV_Shared_ANIMATION_BUY"] call MV_Client_fnc_GetMissionVariable) select 0), 'switchMove']] call MV_Shared_fnc_SendPublicMessage;
        // };
    // };
// -- Leave last
};
