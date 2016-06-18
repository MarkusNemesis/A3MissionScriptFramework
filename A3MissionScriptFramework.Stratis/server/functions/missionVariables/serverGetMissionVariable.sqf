/* serverGetVariable script
Created: 19/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Simply gets a Server_LocObj subarray from the user's personal Server_LocObj array.
1. Iterate through the user's misisonnamespace array in search of the specific array type.
1.1 If found, assign _x to a variable and return it
2. If not found, return objNull.
Params: ['netID', 'arrayType'];
Return: [[content, of, variable]];

Example: [id, "ArrayType"] call MV_Server_fnc_GetMissionVariable;
*/
diag_log format ['MV: serverGetVariable: %1, Object: %2', _this, objectFromNetId (_this select 0)];
private ['_lObj', '_ID', '_aType', '_obj', '_mVarName', '_aReturn'];
_lObj = (call M_S_fnc_GLV);
_ID = _this select 0;
_aType = _this select 1;
// -- Am I dealing with a player?
_obj = (objectFromNetId _ID);
if (isPlayer _obj) then {
	if ([_obj] call MV_Shared_fnc_isPlayerOnFoot) then 
	{
		_ID = getPlayerUID _obj;
	};
};

_mVarName = format ["%1_missionVar", _ID];
_aReturn = objNull;
// -- Get this user's array.
diag_log format ["MV: serverGetVariable: User's varname is: %1", _mVarName];
_mArray = _lObj getVariable _mVarName;
{
	if ((_x select 0) == (_aType)) exitwith 
	{
		_aReturn = _x select 1; // Return the contents of the array.
		diag_log format ["MV: serverGetVariable: _x select 1: %1, _x: %2", _x select 1, _x];
	};
} foreach _mArray;

_aReturn