if (!isDedicated) then
{
	_this spawn
	{
		private ["_unit", "_group", "_groupstring", "_mission"];
		_unit = _this select 0;
		_mission = _this select 1;
		enableRadio true;
		sleep 2;
		_group = group _unit;
		_groupstring = (str _group) call TOUR_SI_fnc_groupNameFix;
		_unit sideChat format ["HQ this is %1, do you read? OVER", _groupstring];
		sleep 5;
		TDMC_HQ sideChat format ["Loud and clear %1, go ahead. OVER", _groupstring];
		sleep 5;
		if (_mission call A2S_taskState == "succeeded") then
		{
			_unit sideChat format ["HQ, the objective is complete. OVER", _groupstring];
			sleep 5;
			TDMC_HQ sideChat format ["Excellent work %1, get back to base for some wll earned R&R. OVER", _groupstring];
		}else
		{
			_unit sideChat format ["HQ, we are unable to complete the objective. OVER", _groupstring];
			sleep 5;
			TDMC_HQ sideChat format ["Understood %1, get back to base for a debriefing! I want to know what the hell happened out there! OVER", _groupstring];
		};	
		sleep 5;
		_unit sideChat format ["Copy that HQ. %1 OUT", _groupstring];
		sleep 2;
		enableRadio false;
	};
};
