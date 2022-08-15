params ["_lives","_time"];

_f = execVM "scripts\TOUR_RC\functions\fn_init.sqf";
_a = execVM "scripts\TOUR_RC\dialog\dialog_functions.sqf";
waitUntil {(scriptDone _f)&&(scriptDone _a)};

if (isServer) then
{
	[_lives, _time, true, false] call TOUR_RC_fn_setParams;
	TOUR_RC_deadRadio = radioChannelCreate [[0, 0.5, 1, 1], "Specatator Channel", "%UNIT_NAME", [], true];
	missionNameSpace setVariable ["TOUR_RC_SpecRadio", TOUR_RC_deadRadio, true];
	execVM "scripts\TOUR_RC\checkLoop.sqf";
};

if (!isDedicated) then
{
	missionNameSpace setVariable ["TOUR_RC_playerLoadout", getUnitLoadout player];
	player setVariable ["TOUR_RC_side", side player];
	waitUntil {player == player};
	waitUntil {alive player};
	waitUntil {!isNil {(missionNameSpace getVariable "TOUR_RC_deadUIDs")}};
	waitUntil {!isNil {(missionNameSpace getVariable "TOUR_RC_respawnTime")}};
	waitUntil {!isNil {(missionNameSpace getVariable "TOUR_RC_locked")}};
	waitUntil {!isNil {(missionNameSpace getVariable "TOUR_RC_specRadio")}};
	
	execVM "scripts\TOUR_RC\about.sqf";
	
	if (isNil {player getVariable "TOUR_RC_spectator"}) then
	{
		player addMPEventHandler ["MPKilled", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			if (!isDedicated) then
			{
				if (player == _unit) then
				{
					missionNameSpace setVariable ["TOUR_RC_playerLoadout", getUnitLoadout _unit];
					[]spawn TOUR_RC_fn_playerDead;
				};
			};
		}];
		
		player addMPEventHandler ["MPRespawn", {
			params ["_unit", "_corpse"];
			[_corpse] spawn TOUR_RC_fn_playerRespawn;
		}];
	};
	
	execVM "scripts\TOUR_RC\playerStart.sqf";

};