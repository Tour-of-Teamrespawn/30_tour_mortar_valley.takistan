params ["_corpse"];
player setUnitLoadout (missionNameSpace getVariable "TOUR_RC_playerLoadout");
[]spawn TOUR_RC_fn_wakeUp;
["Terminate"] call BIS_fnc_EGSpectator;
[_corpse] spawn
{
	params ["_corpse"];
	if (!isNull _corpse) then
	{
		hidebody _corpse;
	};
	sleep 10;
	if (!isNull _corpse) then
	{
		deletevehicle _corpse;
	};
};
