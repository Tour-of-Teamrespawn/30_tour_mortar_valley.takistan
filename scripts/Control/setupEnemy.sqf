private ["_faction", "_marker", "_types_array", "_class_type", "_group_type", "_number", "_rndpos", "_safepos", "_grp", "_pat_distance", "_initdone"];

_faction = "UK3CB_TKA_O";
_marker = "TOUR_spawn";
_skill = 1;
_initdone = false;
_count =  0;
TOUR_guardpos = getMarkerPos "TOUR_mkrSector_1";
TOUR_mission_groups = [];
TOUR_mission_units = [];

execVM "scripts\control\guardLoop.sqf";

execVM "scripts\control\setupEnemyVehicle.sqf";

while {true} do
{
	_count = 0;
	if (_initdone) then
	{
		_safepos = getMarkerPos "TOUR_spawn";
	}else
	{
		_count = 1;
		_safepos = getMarkerPos "TOUR_init_spawn";
		if (count TOUR_mission_units >= 20) then
		{
			_initdone = true;
		};
	};
	while {count TOUR_mission_units < 20} do
	{
		if (_count == 0) then
		{
			sleep 200;
		};
		waitUntil {count (nearestObjects [_safepos, ["man"], 40]) == 0};
		_group_type = 				
		[
			["infantry", "UK3CB_TKA_O_AT_FireTeam"],
			["infantry", "UK3CB_TKA_O_UGL_FireTeam"],
			["infantry", "UK3CB_TKA_O_MG_FireTeam"],
			["infantry", "UK3CB_TKA_O_RIF_FireTeam"],
			["infantry", "UK3CB_TKA_O_AR_FireTeam"],
			["infantry", "UK3CB_TKA_O_AT_Squad"],
			["infantry", "UK3CB_TKA_O_AR_Squad"],
			["infantry", "UK3CB_TKA_O_MG_Squad"],
			["infantry", "UK3CB_TKA_O_MK_Squad"],
			["infantry", "UK3CB_TKA_O_RIF_Squad"],
			["infantry", "UK3CB_TKA_O_AT_Squad"],
			["infantry", "UK3CB_TKA_O_AR_Squad"],
			["infantry", "UK3CB_TKA_O_MG_Squad"],
			["infantry", "UK3CB_TKA_O_MK_Squad"],
			["infantry", "UK3CB_TKA_O_RIF_Squad"],
			["infantry", "UK3CB_TKA_O_SniperTeam"],
			["specops", "UK3CB_TKA_O_Recon_SpecSquad"],
			["specops", "UK3CB_TKA_O_Recon_SpecTeam"],
			["specops", "UK3CB_TKA_O_Recon_SpecTeam"]
		];
		
		if (count _group_type > 0) then 
		{
			_grp = createGroup EAST;
			_group_type = _group_type call BIS_fnc_selectRandom;
			_grp = [_safepos, EAST, (configFile >> "CfgGroups" >> "EAST" >> _faction >> (_group_type select 0) >> (_group_type select 1))] call BIS_fnc_spawnGroup;
			TOUR_mission_groups set [count TOUR_mission_groups, _grp];
			waitUntil {(count units _grp > 0)};
			_grp deleteGroupWhenEmpty true;
			{
				//sort out accuracy and skill and loadouts if needed
				_x call Tour_fnc_garbageEH;
				_x call TOUR_fnc_loadouts;
				Tour_mission_units set [count Tour_mission_units, _x];
			}forEach units _grp;
			_pos1 = TOUR_guardpos getpos [200, 123];
			_pos2 = _pos1 getPos [(ceil (random 400)), 303];
			if (_initdone) then
			{
				_wp = _grp addWaypoint [getMarkerPos "TOUR_move", 100];
				_wp setWaypointType "MOVE";
				_wp setWaypointBehaviour "AWARE";
			};
			_wp1 = _grp addWaypoint [_pos2, 0];
			_wp1 setWaypointType "MOVE";
			_wp1 setWaypointBehaviour "AWARE";
			_wp1 setWaypointStatements ["true", "[group this, getPosATL this, 120]spawn TOUR_fnc_rndpatrol;"];
			
		};
		_count = 1;
	};
};