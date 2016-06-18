/*
serverGetLocVar script
Created: 12/04/2013
Author: Markus Davey
Skype: markus.davey
Desc: Gets the location variable name from UI Namespace, then compiles it down to an object, then returns it.
Params: 
Return: serverLocVar
*/

private ['_sLoc'];

_sLoc = (uiNamespace getVariable "Server_LocObj");
call compile format ["_sLoc = %1;", _sLoc];

_sLoc