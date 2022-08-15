params ["_playername"];

if (!isDedicated) then
{
	if (name player == _playername) then
	{	
		_playerObject = allPlayers select ( allPlayers findIf {(toLower name _x) isEqualTo _playername;} );
		[_playerObject, 1] call BIS_fnc_respawnTickets;
		sleep 2;
		setPlayerRespawnTime 0;
		waitUntil {alive player};
		waitUntil {{player == _x}count alldead == 0};
		
		setplayerrespawntime (missionNameSpace getVariable "TOUR_RC_respawnTime");
	};
};
