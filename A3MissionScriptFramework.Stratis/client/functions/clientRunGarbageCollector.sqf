/* clientRunGarbageCollector script
Created: 04/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Iterates through the entire garbage array and deletes from the mission objects whose delay has expired.
*/

{
    if (_x select 1 < time) then
    {
        private ['_unit'];
        _unit = _x select 0;
        unassignVehicle _unit; // Maybe replace with leaveVehicle. Functionality is unclear.
		_unit setPos [0,0,0];
		deleteVehicle _unit;
    };
} foreach Client_PlayerGarbageCollection;