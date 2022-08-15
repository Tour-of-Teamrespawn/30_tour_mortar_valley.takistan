/*
PARAMS:
	0: Centre position of IED area <ARRAY>
	1: Area Size <INTEGER>
	2: Minimal guaranteed bomb count <INTEGER>
	3: Maximal bomb count <INTEGER>	
	4: Side that the bomb will activate for <SIDE>
	5: Variable name of the functions module <VARIABLE>
*/

private ["_ied", "_ieds", "_size", "_marker", "_bombCountMin", "_bombCountMax", "_fmodule", "_side", "_bombPosCount", "_bombtype"];

waituntil {!isnil "BIS_fnc_init"};
if (!isDedicated) then
{
	if (isNil "TOUR_IED_scriptran") then
	{
		execFSM "scripts\TOUR_IED\TOUR_IED_MAIN.fsm";
		execVM "scripts\TOUR_IED\notes.sqf";
		TOUR_IED_scriptran = true;
	};
};

if (!isServer) exitwith {};

if (isNil "TOUR_IED_Triggermen") then
{
	TOUR_IED_Triggermen = [];
};
_size = 10;
_marker = (_this select 0);
_bombCountMin = _this select 1;//6;
_bombCountMax = _this select 2;//10;
_fmodule = _this select 3;
_side = _this select 4;
if (count _this > 5) then
{
	TOUR_IEDtest = true;
}else
{
	TOUR_IEDtest = nil;
};

_bombPosCount = [];

if (((getmarkersize _marker) select 0)>((getmarkersize _marker) select 1)) then
{
	_size = ((getmarkersize _marker) select 0);
}else
{	
	_size = ((getmarkersize _marker) select 1);
};
_roads = ((getMarkerPos _marker) nearRoads _size);

{
	if !((getPosATL _x) inArea _marker) then 
	{
		_roads = _roads - [_x];
	};
}forEach _roads;

if (_bombCountMax > count _roads) exitwith {"There are too many possible IED's, for possible postions" remoteExec ["hint"]; };

{
	if (_x inarea _marker) then
	{
		_bombPosCount set [(count _bombPosCount), _x];
	};
}forEach _roads;

_used = [];
_ieds = [];

if (_bombCountMax > count _bombPosCount) exitwith {"There are too many possible IED's, for possible postions" remoteExec ["hint"]; };

for "_i" from 1 to (_bombCountMin + floor (random (_bombCountMax - _bombCountMin + 1))) do
{

	_rnd = _bombPosCount call BIS_fnc_selectRandom;
	_bombPosCount = _bombPosCount - [_rnd];
	
	_sequence = "";
	for "_i" from 1 to 8 do
	{
		if (floor (random 2) == 0) then
		{
			_sequence = _sequence + "l";
		}
		else
		{
			_sequence = _sequence + "r";
		};
	};
	
	_bombtype = switch (floor (random 4)) do
	{
		case 0:
		{
			"IEDLandBig_F";
		};
		case 1:
		{
			"IEDLandSmall_F";
		};
		case 2:
		{
			"IEDUrbanBig_F";
		};
		case 3:
		{
			"IEDUrbanSmall_F";
		};
	
	};

	_pos = ([(getpos _rnd), (1 +(random 2)), (random 360)] call BIS_fnc_relPos);
	_ied = createVehicle [_bombtype, [_pos select 0, _pos select 1, 0], [], 0, "NONE"];
	_ied addEventHandler ["HIT", {if ((damage (_this select 0) > 0.8)&&(random 3 > 1)) then {null = (_this select 0) execVM "scripts\TOUR_ied\bombDetonate.sqf";};}];
	_ied setPosATL [ _pos select 0, _pos select 1, 0];
	_ied setVariable ["TOUR_IED_bombSequence", [_sequence, (15 + (ceil random 10))], true]; 
	_ied setVariable ["TOUR_IED_bombActive", true, true];
	[_ied, _side] execvm "scripts\TOUR_ied\bombProximityCheck.sqf";
	_ieds set [count _ieds, _ied];
	
};

_fmodule setVariable ["TOUR_IEDs", _ieds, true];
