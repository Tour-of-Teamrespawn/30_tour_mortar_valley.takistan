private ["_marker", "_type_array", "_number", "_grp"];

_marker = "TOUR_spawnVehicle";
_skill = 1;
_count =  0;
_type_array = 				
[
	"UK3CB_TKA_O_UAZ_SPG9",
	"UK3CB_TKA_O_UAZ_MG",
	"UK3CB_TKA_O_BTR60",
	"UK3CB_TKA_O_BTR60",
	"UK3CB_TKA_O_BRDM2"
];

sleep (900 + (random 1800));

while {_count < 5} do
{
	_veh = createVehicle [_type_array call BIS_fnc_selectRandom, getMarkerPos _marker, [], 133, "NONE"];
	_grp = createVehicleCrew _veh;
	
	waitUntil {(count units _grp > 0)};
	{
		//sort out accuracy and skill and loadouts if needed
		_x call Tour_fnc_garbageEH;
		_x call TOUR_fnc_loadouts;
	}forEach units _grp;
	sleep 3;
	_wp = _grp addWaypoint [getMarkerPos "TOUR_vehGuard", 0];
	_wp setWaypointType "Move";
	_wp setWaypointBehaviour "AWARE";
	_wp1 = _grp addWaypoint [getMarkerPos "TOUR_vehGuard", 0];
	_wp1 setWaypointType "GUARD";
	_wp1 setWaypointBehaviour "AWARE";

	_grp deleteGroupWhenEmpty true;
	
	_count = _count + 1;
	sleep (900 + (random 1800));
};