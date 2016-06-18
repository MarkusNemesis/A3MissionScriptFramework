/*
clientSetMissionVariable script
Created: 13/04/2013
Author: Markus Davey
Skype: markus.davey
Desc: Sets clientside only variables.

Objects need to init their variable before it can be used: Use client_LocObj setVariable [format ["%1_missionVar", id], []];
*/
diag_log format ['MV: clientSetVariable: %1', _this];
private ['_lObj', '_args','_mArray', '_found'];
_lObj = (call M_C_fnc_GLV);
_ID = _this select 0;
_args = _this select 1;

// -- set the client_LocObj variable again.
_lObj setVariable [_args select 0, _args select 1];