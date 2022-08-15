if (isServer) then
{
	_time = time + 10;
	_positions = [];
	while {time < _time} do
	{
		_pos = [getMarkerPos "TOUR_mkrAO", 0, 1000, 15, 0, 0.15, 0, [], [[0,0,0], [0,0,0]]] call BIS_fnc_findSafePos; 
		if ((str _pos != "[0,0,0]") && ((count (_pos nearRoads 20)) == 0) && (_pos inArea "TOUR_mkrAO") && (((AGLToASL [_pos select 0, _pos select 1, 0]) select 2) < 75)) then 
		{
			_positions = _positions + [_pos];
		};
		if (count _positions > 5) exitWith
		{
			for "_i" from 1 to 5 do
			{
				_mkr = createMarkerLocal [(format ["TOUR_mkrMortar_%1", _i]), (_positions select (_i - 1))];
				_mkr setMarkerTypeLocal "hd_Dot";
				_mkr setMarkerColorLocal "colorRed";
				_mkr setMarkerTextLocal "Mortar!";
			};
		};
	};

	TOUR_mortars = [];
	{
		_veh = "UK3CB_TKA_O_2b14_82mm" createvehicle _x;
		TOUR_mortars set [count TOUR_mortars, _veh];
		_grp = createVehicleCrew _veh;
		{
			_x call Tour_fnc_garbageEH;
			_x call TOUR_fnc_loadouts;
		}forEach units _grp;
		_dir = 0;
		for "_i" from 1 to 4 do 
		{ 
			_pos = _x getPos [1.65, (_dir - 90)]; 
			_wall = createVehicle ["LAND_bagFence_round_F", _pos, [], _dir + 90, "NONE"]; 
			_wall setpos _pos;
			_dir = _dir + 90;
			_wall setDir _dir; 
		};
	}forEach _positions;
	
	execVM "scripts\control\mortarLoop.sqf";

};