private ["_offset", "_pos"];

TOUR_ss_1 = false;
TOUR_ss_2 = false;
TOUR_ss_3 = false;
TOUR_ss_4 = false;
TOUR_ss_5 = false;

["TOUR_objCiv", {"Protect Civilians"}] call A2S_createSimpleTask;
["TOUR_objCiv", {"Ensure there are no civilian casulaties"}, {"Protect Civilians"}, {"Protect Civilians"}] call A2S_setSimpleTaskDescription;
"TOUR_objCiv" call A2S_taskCommit;

["TOUR_objMortars", {"Destory Mortars"}] call A2S_createSimpleTask;

TOUR_fnc_sectorState = 
{
	_state_sector1 = "#cc3300";
	_text_sector1 = "unsecured";
	if (TOUR_ss_1) then
	{
		_state_sector1 = "#33cc33";
		_text_sector1 = "secured";
	};
	
	_state_sector2 = "#cc3300";
	_text_sector2 = "unsecured";
	if (TOUR_ss_2) then
	{
		_state_sector2 = "#33cc33";
		_text_sector2 = "secured";
	};

	_state_sector3 = "#cc3300";
	_text_sector3 = "unsecured";
	if (TOUR_ss_3) then
	{
		_state_sector3 = "#33cc33";
		_text_sector3 = "secured";
	};

	_state_sector4 = "#cc3300";
	_text_sector4 = "unsecured";
	if (TOUR_ss_4) then
	{
		_state_sector4 = "#33cc33";
		_text_sector4 = "secured";
	};

	_state_sector5 = "#cc3300";
	_text_sector5 = "unsecured";
	if (TOUR_ss_5) then
	{
		_state_sector5 = "#33cc33";
		_text_sector5 = "secured";
	};		
	
	_var = 
	
	call compile format ["[""TOUR_objMortars"", {""Sweep through the sectors and clear it of enemies and mortar positions:<br /><br />
													<font color=""""%1""""><marker name=""""TOUR_mkrSector_1"""">Sector 1 %6</marker></font><br /><br />
													<font color=""""%2""""><marker name=""""TOUR_mkrSector_2"""">Sector 2 %7</marker></font><br /><br />
													<font color=""""%3""""><marker name=""""TOUR_mkrSector_3"""">Sector 3 %8</marker></font><br /><br />
													<font color=""""%4""""><marker name=""""TOUR_mkrSector_4"""">Sector 4 %9</marker></font><br /><br />
													<font color=""""%5""""><marker name=""""TOUR_mkrSector_5"""">Sector 5 %10</marker></font><br /><br />""}, {""Destory Mortars""}, {""Destory Mortars""}] call A2S_setSimpleTaskDescription;", _state_sector1,_state_sector2,_state_sector3,_state_sector4,_state_sector5,_text_sector1,_text_sector2,_text_sector3,_text_sector4,_text_sector5];
	"TOUR_objMortars" call A2S_taskCommit;
	["TOUR_objMortars", "updated"] call A2S_setTaskState;
	if (count _this == 0) then
	{
		"TOUR_objMortars" call A2S_taskHint;
	};
};

[1] call TOUR_fnc_sectorState;
