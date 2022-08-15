if (isServer) then
{
	[]spawn
	{
		sleep 7;
		if ("TOUR_objMortars" call A2S_taskState != "SUCCEEDED") then
		{
			["TOUR_objMortars", "failed"] call A2S_setTaskState;
			"TOUR_objMortars" call A2S_taskCommit;
			sleep 2;
			"TOUR_objMortars" call A2S_taskHint;
			sleep 3;
		};
		if ("TOUR_objCiv" call A2S_taskState != "failed") then
		{
			["TOUR_objCiv", "SUCCEEDED"] call A2S_setTaskState;
			"TOUR_objCiv" call A2S_taskCommit;
			sleep 2;
			"TOUR_objCiv" call A2S_taskHint;
		};
		sleep 12;
		"failed" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
	};
};

if (!isDedicated) then
{
	_this spawn
	{
		private ["_unit", "_group", "_groupstring", "_mission"];
		_unit = _this select 0;
		enableRadio true;
		sleep 2;
		_group = group _unit;
		_groupstring = (str _group) call TOUR_SI_fnc_groupNameFix;
		_unit sideChat format ["HQ this is %1, do you read? OVER", _groupstring];
		sleep 5;
		TOUR_HQ sideChat format ["Loud and clear %1, go ahead. OVER", _groupstring];
		sleep 5;
		_unit sideChat format ["HQ, we are unable to destroy the mortars. OVER", _groupstring];
		sleep 5;
		TOUR_HQ sideChat format ["Understood %1, what the hell happened out there?! We need to order a full retreat! Get back to base ASAP! OVER", _groupstring];	
		sleep 5;
		_unit sideChat format ["Copy that HQ. %1 OUT", _groupstring];
		sleep 2;
		enableRadio false;
	
	};
};
