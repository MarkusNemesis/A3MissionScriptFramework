/* serverDeleteGarbageCollectionEntry script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Iterates through the entire garbage array and remove's the passed object ID's entry.
DOES NOT REMOVE OBJECTS, ONLY THEIR ENTRY WITHIN THE ARRAY THAT DICTATES THEIR REMOVAL.
Params: [objectID]
*/
diag_log format ["MV: serverDeleteGarbageCollectionEntry: %1", _this];
private ['_oID'];
_oID = _this select 0;

{

    if (netid(_x select 0) == _oID) exitwith
    {
        Server_GarbageCollection set [_foreachindex, objnull];
    	Server_GarbageCollection = Server_GarbageCollection - [objnull];
    };
} foreach Server_GarbageCollection;