if (!isServer) exitwith {};

private ["_arraymidpos", "_type_array","_type_array2","_side","_faction","_chance","_vehicle_spawn","_vehicle_end","_grp","_wp1","_detinationreached","_veh","_time", "_new", "_area"];

_type_array = 
[
	"UK3CB_TKC_C_Datsun_Civ_Closed",
	"UK3CB_TKC_C_Datsun_Civ_Open",
	"UK3CB_TKC_C_Gaz24",
	"UK3CB_TKC_C_Golf",
	"UK3CB_TKC_C_Hatchback",
	"UK3CB_TKC_C_Hilux_Civ_Closed",
	"UK3CB_TKC_C_Hilux_Civ_Open",
	"UK3CB_TKC_C_Ikarus",
	"UK3CB_TKC_C_Kamaz_Open",
	"UK3CB_TKC_C_Kamaz_Covered",
	"UK3CB_TKC_C_Kamaz_Repair",
	"UK3CB_TKC_C_Kamaz_Fuel",
	"UK3CB_TKC_C_Lada",
	"UK3CB_TKC_C_Lada_Taxi",
	"UK3CB_TKC_C_LR_Open",
	"UK3CB_TKC_C_LR_Closed",
	"UK3CB_TKC_C_S1203",
	"UK3CB_TKC_C_S1203_Amb",
	"UK3CB_TKC_C_Sedan",
	"UK3CB_TKC_C_Skoda",
	"UK3CB_TKC_C_Tractor",
	"UK3CB_TKC_C_Tractor_Old",
	"UK3CB_TKC_C_UAZ_Closed",
	"UK3CB_TKC_C_UAZ_Open",
	"UK3CB_TKC_C_Ural",
	"UK3CB_TKC_C_Ural_Open",
	"UK3CB_TKC_C_Ural_Fuel",
	"UK3CB_TKC_C_Ural_Empty",
	"UK3CB_TKC_C_Ural_Recovery",
	"UK3CB_TKC_C_V3S_Open",
	"UK3CB_TKC_C_V3S_Closed",
	"UK3CB_TKC_C_V3S_Recovery",
	"UK3CB_TKC_C_V3S_Refuel"
];

_enemy_array = 
[
	"UK3CB_TKA_O_Hilux_Closed",
	"UK3CB_TKA_O_Hilux_Open",
	"UK3CB_TKA_O_Hilux_Dshkm",
	"UK3CB_TKA_O_Hilux_GMG",
	"UK3CB_TKA_O_Hilux_PKM",
	"UK3CB_TKA_O_Hilux_Spg9",
	"UK3CB_TKA_O_Hilux_Zu23",
	"UK3CB_TKA_O_GAZ_Vodnik",
	"UK3CB_TKA_O_GAZ_Vodnik_MedEvac",
	"UK3CB_TKA_O_GAZ_Vodnik_PKT",
	"UK3CB_TKA_O_GAZ_Vodnik_KVPT",
	"UK3CB_TKA_O_GAZ_Vodnik_Cannon",
	"UK3CB_TKA_O_GAZ_Vodnik_GMG",
	"UK3CB_TKA_O_GAZ_Vodnik_HMG",
	"UK3CB_TKA_O_Tigr",
	"UK3CB_TKA_O_Tigr_FFV",
	"UK3CB_TKA_O_Tigr_STS",
	"UK3CB_TKA_O_Ural",
	"UK3CB_TKA_O_Ural_Ammo",
	"UK3CB_TKA_O_Ural_Empty",
	"UK3CB_TKA_O_Ural_Fuel",
	"UK3CB_TKA_O_Ural_Open",
	"UK3CB_TKA_O_Ural_Recovery",
	"UK3CB_TKA_O_Ural_Repair",
	"UK3CB_TKA_O_Ural_Zu23"
];

_chance = _this;

while {true} do
{
	if ((floor (random 101)) <= _chance) then
	{
		_positions = [];
		for "_i" from 1 to 5 do
		{
			_positions set [count _positions, getMarkerPos (format ["TOUR_mkrCar_%1", _i])];
		};
		_vehicle_spawn = _positions call BIS_fnc_selectRandom;
		_positions = _positions - [_vehicle_spawn];
		_vehicle_end = _positions call BIS_fnc_selectRandom;			

		waitUntil {count (nearestObjects [_vehicle_spawn, ["LandVehicle"], 10]) == 0};

		_veh = createVehicle [_enemy_array call BIS_fnc_selectRandom, _vehicle_spawn, [], 0, "CAN_COLLIDE"];
		_veh setDir ([_vehicle_spawn, _vehicle_end] call BIS_fnc_dirTo);
		_veh setPosATL _vehicle_spawn;
		_veh setVelocity [0,0,-1];

		_grp = createGroup EAST;
		[_veh, _grp] call BIS_fnc_spawnCrew;
		{
			_x call Tour_fnc_garbageEH;
			_x call TOUR_fnc_loadouts;
		}forEach units _grp;
		_wp1 = _grp addWaypoint [_vehicle_end, 0];
		_wp1 setWaypointSpeed "NORMAL";
		_wp1 setWaypointCombatMode "RED";
		_time = time + 100;
		_detinationreached = false;
		while {(({alive _x} count units _grp) > 0)} do 
		{
			if ( ({((_vehicle_end distance (vehicle _x)) <= 30)&&(alive _x)} count units _grp) == ({alive _x} count units _grp) ) exitwith {_detinationreached = true;};
			if ((({((_vehicle_spawn distance (vehicle _x)) < 50)&&(alive _x)} count units _grp) == ({alive _x} count units _grp)) && (_time < time) ) exitWith {_detinationreached = true;};	
			if (!canMove _veh) exitWith {};				
			sleep 2;
		};
		_time = time + 300;
		while {!_detinationreached} do
		{
			if ((({(side _x == WEST)} count nearestObjects [_veh, ["landvehicle", "man"], 500]) == 0)or(_time < time)) exitWith {};
			sleep 2;
		};
		if (!isNull _veh) then 
		{
			deleteVehicle _veh;
		};
		if (!isNull _grp) then
		{
			{
				deleteVehicle _x;
			}foreach units _grp;
			deleteGroup _grp;
		};
	}else
	{
		_positions = [];
		for "_i" from 1 to 5 do
		{
			_positions set [count _positions, getMarkerPos (format ["TOUR_mkrCar_%1", _i])];
		};
		_vehicle_spawn = _positions call BIS_fnc_selectRandom;
		_positions = _positions - [_vehicle_spawn];
		_vehicle_end = _positions call BIS_fnc_selectRandom;			

		waitUntil {count (nearestObjects [_vehicle_spawn, ["LandVehicle"], 10]) == 0};
		
		_veh = createVehicle [_type_array call BIS_fnc_selectRandom, _vehicle_spawn, [], 0, "CAN_COLLIDE"];
		_veh setDir ([_vehicle_spawn, _vehicle_end] call BIS_fnc_dirTo);
		_veh setPosATL _vehicle_spawn;
		_veh setVelocity [0,0,-1];

		_grp = createGroup CIVILIAN;
		_type = ["UK3CB_TKC_C_CIV", "UK3CB_TKC_C_CIV","UK3CB_TKC_C_CIV", "UK3CB_TKC_C_SPOT", "UK3CB_TKC_C_WORKER"];
		_man = _grp createUnit [(_type call BIS_fnc_selectRandom), _vehicle_spawn, [], 0, "NONE"];
		_man assignAsDriver _veh;
		_man moveInDriver _veh;
		
		{
			_x call Tour_fnc_garbageEH;
			_x call TOUR_fnc_loadouts;
			_x setVariable ["BIS_noCoreConversations",true];
		}forEach units _grp;
		
		_wp1 = _grp addWaypoint [_vehicle_end, 0];
		_wp1 setWaypointSpeed "NORMAL";
		
		_detinationreached = false;
		_time = time + 100;
		while {(({alive _x} count units _grp) > 0)} do 
		{
			if ( ({((_vehicle_end distance (vehicle _x)) <= 30)&&(alive _x)} count units _grp) == ({alive _x} count units _grp) ) exitwith {_detinationreached = true;};
			if ((({((_vehicle_spawn distance (vehicle _x)) < 50)&&(alive _x)} count units _grp) == ({alive _x} count units _grp)) && (_time < time) ) exitWith {_detinationreached = true;};
			if (!canMove _veh) exitWith {};
			sleep 2;
		};
		_time = time + 300;
		while {!_detinationreached} do
		{
			if ((({(side _x == WEST)} count nearestObjects [_veh, ["landvehicle", "man"], 500]) == 0)or(_time < time)) exitWith {};
			sleep 2;
		};
		if (!isNull _veh) then 
		{
			deleteVehicle _veh;
		};
		if (!isNull _grp) then
		{
			{
				deleteVehicle _x;
			}foreach units _grp;
			deleteGroup _grp;
		};

	};
	
	sleep random 150;
};
