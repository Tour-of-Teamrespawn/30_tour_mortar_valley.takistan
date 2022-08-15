//Validate parameter count
if ((count _this) < 3) exitWith {debugLog "Log: [taskPatrol] Function requires at least 3 parameters!"; false};

private ["_grp", "_pos", "_maxDist", "_blacklist"];
_grp = _this select 0;
_pos = _this select 1;
_maxDist = _this select 2;

_blacklist = [];
if ((count _this) > 3) then {_blacklist = _this select 3};
_mkr = "TOUR_Null_Marker_Name";
if ((count _this) > 4) then {_mkr = _this select 4};

//Validate parameters
if ((typeName _grp) != (typeName grpNull)) exitWith {debugLog "Log: [taskPatrol] Group (0) must be a Group!"; false};
if ((typeName _pos) != (typeName [])) exitWith {debugLog "Log: [taskPatrol] Position (1) must be an Array!"; false};
if ((typeName _maxDist) != (typeName 0)) exitWith {debugLog "Log: [taskPatrol] Maximum distance (2) must be a Number!"; false};
if ((typeName _blacklist) != (typeName [])) exitWith {debugLog "Log: [taskPatrol] Blacklist (3) must be an Array!"; false};

//_grp setBehaviour "SAFE"; // removed this to make units more active

//Create a string of randomly placed waypoints.
private ["_prevPos", "_newPos"];
_prevPos = _pos;
for "_i" from 0 to (2 + (floor (random 3))) do
{
	private ["_wp", "_newPos"];
	if (vehicle (leader _grp) isKindof "Air") then
	{
		_newPos = [_prevPos, _maxDist / 1.5, _maxDist, 1, 1, 0, 0, _blacklist] call BIS_fnc_findSafePos;
	}else
	{
		if ((str (getMarkerPos _mkr)) == "[0,0,0]") then
		{
			_newPos = [_prevPos, _maxDist / 2, _maxDist, 1, 0, 1, 0, _blacklist] call BIS_fnc_findSafePos;
		}else
		{
			_newpos = [-4000,-4000,0];
			while {!(_newpos inArea _mkr)} do
			{
				_newPos = [_prevPos, _maxDist / 2, _maxDist, 1, 0, 1, 0, _blacklist] call BIS_fnc_findSafePos;
			};
		};
	};

	_wp = _grp addWaypoint [_newPos, 0];
	_wp setWaypointType "MOVE";
	_wp setWaypointCompletionRadius 20;
	//Set the group's speed and formation at the first waypoint.
	if (_i == 0) then
	{
		_wp setWaypointSpeed "LIMITED";	
		_wp setWaypointBehaviour "COMBAT";		
		if !(vehicle (leader _grp) isKindof "Air") then
		{
			_wp setWaypointFormation "STAG COLUMN";
		};
	};
};

//Cycle back to the first position.
private ["_wp"];
_wp = _grp addWaypoint [_pos, 0];
_wp setWaypointType "CYCLE";
_wp setWaypointCompletionRadius 20;

true