/* clientPublicCommVarEH script
Created: 25/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Handles any event messages over the PublicMessageBroadcast variable.
*/
diag_log format ["MV: clientPublicCommVarEH: Message: %1", PublicMessageBroadcast];
private ['_mType', '_args'];
_type = PublicMessageBroadcast select 0;
_args = PublicMessageBroadcast select 1;

if (isnil '_type' or isnil '_args') exitwith {diag_log format ["MV: clientPublicCommVarEH: ERROR! Nil variable! message: %1", PublicMessageBroadcast];};

switch (_type) do
{

	case "SpawnhavenInit":
	{
		Shared_SpawnHaven = objectFromNetId (_args select 0);
		diag_log "Spawnhaven initialised";
	};
	case "AnimationEvent":
	{// -- Args format: [strNetID, strAnim, strActionType];
		private ['_aObj', '_anim', '_aType', '_aTypes'];
		_aObj = objectFromNetId (_args select 0);
		_anim = _args select 1;
		_aType = _args select 2;
		_aTypes = ['switchMove', 'playMove', 'playMoveNow', 'playAction', 'playActionNow']; /// -- Action types are CAPS SENSITIVE!
		if (_aType in _aTypes) exitwith {
			call compile format ["_aObj %1 _anim;", _aType];
		};
		diag_log "MV: clientPublicCommVarEH: Message: ERROR: _aType not in _aTypes.";
	};
};