/* clientAddDeathObject script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Adds objects to the death object collection array for this client. This array is handled on player death and all remaining objects
are given to the garbage collector.
Return:
*/

private ['_object'];

_objects = _this;

{
    Client_PlayerDeathObjectCollection set [count Client_PlayerDeathObjectCollection, _x];
} foreach _objects;
