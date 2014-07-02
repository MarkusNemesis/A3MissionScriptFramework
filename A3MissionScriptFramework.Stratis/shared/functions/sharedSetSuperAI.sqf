/* sharedSetSuperAI script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: Sets the passed AI unit to become a super AI, based off the profile.
*/

private['_unit', '_profile'];

_unit = _this select 0;
_profile = _this select 1;

switch (_profile) do
{
    case 'super':
    {
		_unit setskill ["aimingAccuracy", 100000];
		_unit setskill ["aimingShake", 100000];
		_unit setskill ["aimingSpeed", 2];
		_unit setskill ["endurance", 100000];
		_unit setskill ["spotDistance", 100000];
		_unit setskill ["spotTime", 100000];
		_unit setskill ["courage", 100000];
		_unit setskill ["commanding", 100000];
		_unit setskill ["general", 100000];
    };
    default 
    {
        diag_log format ['MV: ERROR: AI unit superAI profile undefined: %1', _profile];
    };
};