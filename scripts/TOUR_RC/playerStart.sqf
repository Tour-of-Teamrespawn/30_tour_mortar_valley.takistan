if (!isNil {player getVariable "TOUR_RC_spectator"}) then
{
	// player is a spectator
	cutText ["", "BLACK OUT", 0];
	[side player, 1] call BIS_fnc_respawnTickets;
	player setDamage 1;
	[] spawn TOUR_RC_fn_radio;
	sleep 1;
	["Initialize",[player, [], true, true, true, true, true, true, true, true]] call BIS_fnc_EGSpectator;
	cutText ["", "BLACK IN", 2];
	["<t color='#ffffff' size = '.8'>SPECTATING MODE</t><br /><t color='#ffffff' size = '.6'>Please wait patiently till the end of the round.</t>",-1,-1,8,1,0,789] spawn BIS_fnc_dynamicText;
	sleep 2;
	setplayerRespawnTime 2000000;
}else
{
	// player is NOT a spectator
	if ((getPlayerUID player) in (missionNameSpace getVariable "TOUR_RC_deadUIDs")) then
	{
		//player has died and rejoined - bypass respawn
		TOUR_RC_message = ["<t color='#ffffff' size = '.8'>SPECTATING MODE</t><br /><br /><t color='#ffffff' size = '.6'>You have no respawn tickets left, please wait patiently till the end of the round.</t>",-1,-1,8,1,0,789];
		player setDamage 1;
	}else
	{
		if (missionNameSpace getVariable "TOUR_RC_locked") then
		{
			//slots are locked, await admin release
			TOUR_RC_lockWait = true;
			TOUR_RC_message = ["<t color='#ffffff' size = '.8'>SLOTS LOCKED</t><br /><br /><t color='#ffffff' size = '.6'>All new joiners are temporarily blocked until an admin allows you to join.</t>",-1,-1,8,1,0,789];
			[side player, 1] call BIS_fnc_respawnTickets;
			sleep 1;
			player setDamage 1;
		};
	};
};

waitUntil {!isNull (findDisplay 46)};	
(findDisplay 46) displayAddEventHandler ["keyUp", "_this CALL TOUR_RC_dlg_fnc_open"];