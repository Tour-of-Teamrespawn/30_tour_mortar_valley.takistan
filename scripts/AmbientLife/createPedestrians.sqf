private ["_marker", "_pos", "_groups", "_civs", "_posArray", "_buildings", "_buildingsnew", "_presence"];

_marker = (_this select 0);

_presence = 0;
_posArray = [];
_buildings = [];
_buildingsnew = [];
_groups = [];
_civs = [];
_array =  ["UK3CB_TKC_C_CIV", "UK3CB_TKC_C_CIV","UK3CB_TKC_C_CIV", "UK3CB_TKC_C_SPOT", "UK3CB_TKC_C_WORKER"];

{
	if (_x inArea _marker) then
	{
		_buildings set [count _buildings, _x];
	};
}forEach (nearestObjects [getMarkerPos _marker,["Building","House"], 1100]);

if (count _buildings > 0) then 
{
	{
		
		if ((getposATL _x) inArea _marker) then 
		{
			_buildingsnew set [count _buildingsnew, _x];
		};
	}forEach _buildings;
};

_posArray = [];

if (count _buildingsnew > 0) then
{
	{
		if ((count ([(_buildingsnew select _forEachIndex)] call BIS_fnc_buildingPositions)) > 5) then {_posArray = _posArray + [(([(_buildingsnew select _forEachIndex)] call BIS_fnc_buildingPositions) call BIS_fnc_selectRandom)];};
	}forEach _buildingsnew;
};
_civCountGlobalTotal = 0;

for "_i" from 1 to 12 do
{
	_pos = (_posArray call BIS_fnc_selectRandom);
	_posArray = _posArray - [_pos];
	_type = _array call BIS_fnc_selectRandom;
	_grp = createGroup CIVILIAN;
	_groups = _groups + [_grp];
	_unit = _grp createUnit [_type, _pos, [], 0, "NONE"];
	_civs = _civs + [_unit];
	_civCountGlobalTotal = _civCountGlobalTotal + 1;
	_unit call Tour_fnc_garbageEH;
	_unit call TOUR_fnc_loadouts;
	[_unit, _posArray] execFSM "scripts\ambientLife\civilianControl.fsm";
};
