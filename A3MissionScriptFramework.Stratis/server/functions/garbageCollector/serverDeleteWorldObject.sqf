/*
serverDeleteWorldObject script
Created: 12/04/2013
Author: Markus Davey
Skype: markus.davey
Desc: Deletes a world object.
Remove object from the Garbage collector (if present)
call 'onRemove' script stored within it (in mission var)
TODO TODO TODO clear object's variables via simply searching for it's netID and setting the object's array to objnull and removing it from the array.
TODO implement 'onRemove' script and store in created objects.
Params: [Obj, garbagecollectorAction]
Return: 
*/
diag_log format ["MV: serverDeleteWorldObject: %1", _this];
private ['_dObj', '_gcA'];

_dObj = _this select 0; // object
if ((count _this) > 1) then {_gcA = _this select 1;} else {_gcA = false;}; // bool

// -- Remove object from garbage collector, if not a gcA (garbage collector Action).***
if (!_gcA) then // Remove from GC array.
{
	[netid _dObj] call MV_Server_fnc_DeleteGarbageCollectionEntry;
};

// -- Run object's 'onRemove' function from it's mission var. TODO


// -- Remove the object's variable array.
[netId _dObj] call MV_Server_fnc_RemoveObjectMissionVariableArray;

// -- Remove the object
private ['_crw'];
_crw = crew _dObj;
{
	if ((!isPlayer _x) && (damage _x < 1)) then {[_x] call MV_Server_fnc_DeleteWorldObject;} else {_x action ["getOut", _dObj]; unassignVehicle _x;};
} foreach _crw;

unassignVehicle _dObj; // Maybe replace with leaveVehicle. Functionality is unclear.
_dObj setPos [-1000,-1000,-1000];
diag_log format ["MV: serverDeleteWorldObject: Deleting %1", _dObj];
deleteVehicle _dObj;