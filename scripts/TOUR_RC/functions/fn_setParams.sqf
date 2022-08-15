params ["_lives","_time","_clear","_locked"];

{
	_number = [_x] call BIS_fnc_respawnTickets;
	if (_number < 1) then
	{
		_number = 0;
	};
	_add = (_lives select _forEachIndex) - _number;
	[_x, _add] call BIS_fnc_respawnTickets;
}forEach [WEST, EAST, INDEPENDENT, CIVILIAN];

if (_clear) then
{
	missionNameSpace setVariable ["TOUR_RC_deadUIDs", [], true];
};

missionNameSpace setVariable ["TOUR_RC_respawnTime", _time, true];
missionNameSpace setVariable ["TOUR_RC_Locked", _locked, true];