/* clientAddEvent script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Params: "function_name", [args], priority
Desc: Adds an event to the Client_EventArray which is ran by the main loop.
*/

private ["_fName", "_args", "_priority"];

_fName = _this select 0;
_args = _this select 1;
_priority = _this select 2;

Client_EventArray set [count Client_EventArray, [_fName, _args, _priority]];