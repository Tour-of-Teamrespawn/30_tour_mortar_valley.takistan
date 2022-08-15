private ["_unit","_grp", "_time"];

_unit = (_this select 0);
_time = time;

{
	if (_x == _unit) then
	{
		TOUR_mission_units = TOUR_mission_units - [_x];
	};
}forEach Tour_mission_units;

if (_unit isKindOf "MAN") then
{
	_grp = group _unit;	
	TOUR_garbagearray set [count TOUR_garbagearray, [_unit, _time, _grp]];
}else
{
	TOUR_garbagearray set [count TOUR_garbagearray, [_unit, _time]];
};

