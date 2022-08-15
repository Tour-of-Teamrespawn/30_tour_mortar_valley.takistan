_int = _this;
call compile format ["TOUR_ss_%1 = true;", _int];

call compile format ["""TOUR_mkrSector_%1"" setMarkerColor ""colorGreen"";", _int];
sleep 2;
if (TOUR_ss_1 && TOUR_ss_2 && TOUR_ss_3 && TOUR_ss_4 && TOUR_ss_5) then
{
	[1] call TOUR_fnc_sectorState;
	sleep 1;
	["TOUR_objMortars", "succeeded"] call A2S_setTaskState;
	"TOUR_objMortars" call A2S_taskCommit;
	sleep 2;
	"TOUR_objMortars" call A2S_taskHint;
	execVM "scripts\control\endingComplete.sqf";
}else
{
	[] call TOUR_fnc_sectorState;
};
