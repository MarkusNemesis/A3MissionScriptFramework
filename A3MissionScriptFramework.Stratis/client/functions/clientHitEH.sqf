/* clientHitEH script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Adds hits to the Client_HitArray, to be processed by the client core loop. 
*/

private ['_hitee', '_hiter', '_dmg', '_found'];

_hitee = _this select 0;
_hiter = _this select 3;
_dmg = _this select 2;
_found = false;

// Hit is added to the Client_HitArray. format [_hiter, _dmg - (damage _hitee)] - though may not need to make the difference.
//Client_HitArray set [count Client_HitArray, [name _hiter,  _dmg]];
if (alive player) then
{
	{
	    diag_log format ["Select: %1 Hitter: %2", _x select 0, str name _hiter];
	    if (_x select 0 == str name _hiter && !_found) then
	    {
	        diag_log "Updating entry";
	        private ['_tmpEntry'];
	        // Create new entry
	        _tmpEntry = [str name _hiter,  (_dmg + (_x select 1))];
	        // Remove old entry
	        Client_HitArray set [_forEachIndex, objnull];
	        Client_HitArray = Client_HitArray - [objnull];
	        // Add new entry
	        Client_HitArray set [count Client_HitArray, _tmpEntry];
	        _found = true;
	    };
	} foreach Client_HitArray;
	// If the name isn't found, just add to the array.
	if (!_found) then {Client_HitArray set [count Client_HitArray, [str name _hiter,  _dmg]]; diag_log "Adding new entry";};
	
	diag_log format ["%1 : %2", str name _hitee, [str name _hiter,  _dmg]];
	diag_log format ["%1", Client_HitArray];
};
// Return
_this select 2;