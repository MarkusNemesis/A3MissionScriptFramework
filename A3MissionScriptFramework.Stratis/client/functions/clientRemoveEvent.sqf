/* clientRemoveEvent script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Params: "function_name", [args], priority
Desc: Adds an event to the Client_EventArray which is ran by the main loop.
*/

private ["_index"];

_index = _this select 0;

Client_EventArray set [_index, objnull]; // Blank the event
Client_EventArray = Client_EventArray - [objnull]; // Remove the blank from the array.