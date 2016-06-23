/* serverRunGarbageCollector script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Iterates through the entire garbage array and deletes from the mission objects whose delay has expired.
*/

{
    if (_x select 1 < time) then
    {
        private ['_unit', '_crew', '_isOccupied'];
        _unit = _x select 0;
        _crew = crew (_unit);
        _isOccupied = false;
        {
            if (/*isPlayer _x && */damage _x < 1) exitwith { _isOccupied = true;};
        } foreach _crew;
        // -- If the unit is occupied by a player or AI, and they're alive, reset the garbage collection timer.
        if (damage _unit < 1 && _isOccupied) exitwith {[_unit] call MV_Server_fnc_UpdateGarbageObject};
        
		// -- Remove the object.
        [_x select 0] call MV_Server_fnc_DeleteWorldObject;
        Server_GarbageCollection set [_foreachindex, objnull];
    	Server_GarbageCollection = Server_GarbageCollection - [objnull];
    };
} foreach Server_GarbageCollection;