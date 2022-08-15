private ["_int", "_nearest", "_array", "_pos1", "_pos"];

while {true} do
{
	_men = (nearestObjects [(getMarkerPos "TOUR_mkrSector_5"), ["man"], 3000]);
	{
		_man = _x;
		if ((alive _man)&&(side _man == WEST)) exitWith
		{
			_array = [];
			for "_i" from 1 to 5 do
			{
				_array set [count _array, ((getMarkerPos (format ["TOUR_mkrSector_%1", _i])) distance _man)];
			};
			_nearest = _array select 0;
			_int = 1;
			{
				if (_x < _nearest) then
				{
					_nearest = _x;
					_int = _forEachIndex + 1;
				};
			}forEach _array;
			if ((str TOUR_guardpos) != str (getMarkerPos (format ["TOUR_mkrSector_%1", _int]))) then
			{
				sleep 1;
				TOUR_guardpos = getMarkerPos (format ["TOUR_mkrSector_%1", _int]);
				{
					if ((side _x == EAST)&&(_x == leader (group _x))&&((count (waypoints (group _x))) > 1)&&(vehicle _x == _x)) then
					{
						{
							deleteWaypoint _x;
						}forEach (waypoints (group _x));
						_pos1 = TOUR_guardpos getPos [200, 123];
						_pos2 = _pos1 getPos [(ceil (random 400)), 303];
						(group _x) setBehaviour "AWARE";
						(group _x) setCombatMode "RED";
						_wp1 = (group _x) addWaypoint [_pos2, 100];
						_wp1 setWaypointType "MOVE";
						_wp1 setWaypointSpeed "NORMAL";
						_wp1 setWaypointBehaviour "AWARE";
						_wp1 setWaypointStatements ["true", "[group this, getPosATL this, 100]spawn TOUR_fnc_rndpatrol"];
					};
				}forEach allUnits;
			};
		};
	}forEach _men;
	sleep 10;
};