/* serverSetMissionVariable script
Created: 19/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Sets serverside only variables.
1. Searches for pre-existing entries.
1.1 Updates entry as if it were a setVariable command.
2. If entry doesn't exist, creates a new one. via [	['arrayType1', [content, of, variable]	], ['arrayType2', [content, of, variable]	]	];
Params: ['netID', ['arrayType', [content,array,etc]];
Example: [_sNetID, ["isInteractable", [true]]] call MV_Server_fnc_SetMissionVariable;

Objects need to init their variable before it can be used: Use Server_LocObj setVariable [format ["%1_missionVar", id], []];
*/
diag_log format ['MV: serverSetVariable: %1', _this];
private ['_lObj', '_ID', '_args', '_obj', '_mVarName','_mArray', '_found'];
_lObj = (call M_S_fnc_GLV);
_ID = _this select 0;
_args = _this select 1;
// -- Am I dealing with a player?
_obj = (objectFromNetId _ID);

if ([_obj] call MV_Shared_fnc_isPlayerOnFoot) then 
{
	_ID = getPlayerUID _obj;
};


_mVarName = format ["%1_missionVar", _ID];
_found = false;
_mArray = [];
// -- Find the array that contains the type of array we're after.
//diag_log format ["MV: User's varname is: %1", _mVarName];
_mArray = _lObj getVariable _mVarName;

if (isnil "_mArray") exitwith {diag_log format ["MV: serverSetMissionVariable: ERROR: %1 has no missionVar. Args: %2", _ID, _args];};

{
	if ((_x select 0) == (_args select 0)) exitwith 
	{
		_mArray set [_foreachindex, _args];
		_found = true;
	};
} foreach _mArray;

// -- If it's not found, then just tack the 'set' to the end of the array.
if (!_found) then 
{
	_mArray set [count _mArray, _args];
};

// -- Finally, set the Server_LocObj variable again.
_lObj setVariable [_mVarName, _mArray];