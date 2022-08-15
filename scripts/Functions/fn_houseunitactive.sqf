if (!isServer) exitwith {};
if (random 10 >= 7) then
{
	_guy = _this select 0;
	_guy removeAllEventHandlers "FIREDNEAR";
	_guy removeAllEventHandlers "HIT";
	_wp = group _guy addwaypoint [getpos _guy, 0];
	_wp setwaypointtype "MOVE";
	_wp setwaypointcombatmode "RED";
	_wp setwaypointbehaviour "COMBAT";
};