/* init.sqf script
Created: 02/03/2013
Author: Markus Davey
Skype: markus.davey
Desc: If it's a server and dedicated, it'll only run the serverInit. If the server is not dedicated, the client init will also run. 
If it's not a server, it's a client and runs the clientInit.
Return:
*/

if (isServer) then 
{ 
    if (!isDedicated) then {execVM "client\clientInit.sqf";}; // 'server' is a client hosting the mission. Run both main loops. 
    execVM "server\serverInit.sqf";
};

if (!isServer) then {
    execVM "client\clientInit.sqf"; // system is a client, run only the client loop.
};