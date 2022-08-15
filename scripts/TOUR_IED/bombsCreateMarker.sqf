/*
PARAMS:
	0: Number of possible bomb positions <INTEGER>
	1: Minimal guaranteed bomb count <INTEGER>
	2: Maximal bomb count <INTEGER>	
	3: Side that the bomb will activate for <SIDE>
	4: Variable name of the functions module <VARIABLE>
*/

TOUR_IED_failhint = {hint "There are too many possible IED's, for possible postions"};

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

_bombPosCount = _this select 0;//10;
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

publicVariable "TOUR_IEDtest";

_used = [];
_ieds = [];

if (_bombCountMax > _bombPosCount) exitwith {[[],"TOUR_IED_failhint"]call BIS_fnc_MP;};

for "_i" from 1 to (_bombCountMin + floor (random (_bombCountMax - _bombCountMin + 1))) do
{
	_rnd = 0;
	while {_rnd == 0 || _rnd in _used} do
	{
		_rnd = floor (random (_bombPosCount + 1));
	};
	_used set [count _used, _rnd];
	
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
//	hint str _sequence;
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

	_pos = [(getMarkerPos format ["TOUR_IED_%1", _rnd]) select 0, (getMarkerPos format ["TOUR_IED_%1", _rnd]) select 1, 0];
	_ied = createVehicle [_bombtype, [_pos select 0, _pos select 1, 0], [], 0, "NONE"];
	_ied addEventHandler ["HIT", {if ((damage (_this select 0) > 0.8)&&(random 3 > 1)) then {null = (_this select 0) execVM "scripts\TOUR_ied\bombDetonate.sqf";};}];
	_ied setPosATL [ _pos select 0, _pos select 1, 0];
	_ied setVariable ["TOUR_IED_bombSequence", [_sequence, (20 + (ceil random 10))], true]; _ied setVariable ["TOUR_IED_bombActive", true, true];
	[_ied, _side] execvm "scripts\TOUR_ied\bombProximityCheck.sqf";
	_ieds set [count _ieds, _ied];

};

_fmodule setVariable ["TOUR_IEDs", _ieds, true];

