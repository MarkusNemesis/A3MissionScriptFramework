/* serverAddEvent script
Created: 14/03/2013
Author: Markus Davey
Skype: markus.davey
Params: "function_name", [args], execTime
Desc: Adds an event to the Server_EventArray which is ran by the main loop.
*/

private ["_fName", "_args", "_eTime"];

_fName = _this select 0;
_args = _this select 1;
_eTime = _this select 2;
if (isnil '_eTime') then {_eTime = -1}; // means the event will be executed in the next cycle, vs waiting till a specific time.
Server_EventArray set [count Server_EventArray, [_fName, _args, _eTime]];