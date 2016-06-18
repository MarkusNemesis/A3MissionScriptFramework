/* serverRemoveEvent script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Params: "function_name", [args], priority
Desc: Adds an event to the Server_EventArray which is ran by the main loop.
*/

private ["_index"];

_index = _this select 0;

Server_EventArray set [_index, objnull]; // Blank the event
Server_EventArray = Server_EventArray - [objnull]; // Remove the blank from the array.