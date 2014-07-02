/* clientKilledEH script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Runs when the player is killed. It destroys all items inside the Client_PlayerDeathObjectCollection array and adds them to the garbage collector
Also sends a message to the server with the kill stats. ie percentage damage from who etc.
*/

{
    _x setDamage 1; // Kills the object
    [_x] call MV_Client_fnc_AddGarbage;
} foreach Client_PlayerDeathObjectCollection;

Client_PlayerSpawned = false;

// Sending kill messages to the server
// Sort the Client_HitArray into the _sortedHitArray.
private ['_tmpSmallest', '_sortedHitArray'];
_sortedHitArray = [];
_tmpSmallest = [];
if (count Client_HitArray > 1) then {
	{
	    //diag_log "sorting";
	     _tmpSmallest = Client_HitArray select 0;
	     {if ((_x select 1) < (_tmpSmallest select 1)) then {_tmpSmallest = _x}} forEach Client_HitArray;
	     _sortedHitArray = _sortedHitArray + [_tmpSmallest];
	     Client_HitArray = Client_HitArray - [_tmpSmallest];
	} forEach Client_HitArray;
    //diag_log format ["%1", _sortedHitArray];
} else {diag_log format ["%1", Client_HitArray];};

// Invert the array so that it's highest first, as well as tally up the total damage done.
private['_totalDmg'];
_totalDmg = 0;
_sortedHitArray = [];
for "_i" from count Client_HitArray - 1 to 0 do
{
    _sortedHitArray set [count _sortedHitArray, Client_HitArray select _i];
    _totalDmg = _totalDmg + ((Client_HitArray select _i) select 1);
};
Client_HitArray = _sortedHitArray;

// Find out which did what percentage of damage.
private['_resultArray', '_i'];
_resultArray = [];
_i = 0;

KillMessageBroadcast = format ["%1 killed by: ", Client_PlayerName];
{
    private ['_tDmg'];
   	_resultArray set [count _resultArray, [_x select 0, ((_x select 1) / _totalDmg) * 100]];
    _tDmg = ((_resultArray select (count _resultArray -1)) select 1);
    //if (_i < 3) then
    //{
    	KillMessageBroadcast = format ["%1 %2: %3%4, ", KillMessageBroadcast, _x select 0, "%", _tDmg];
        //_i = _i + 1;
    //};
} foreach Client_HitArray;

publicVariable "KillMessageBroadcast";
call MV_Client_fnc_KillMessage;


//TODO reduce number of lives left on the player if applicable by communicating to the server.