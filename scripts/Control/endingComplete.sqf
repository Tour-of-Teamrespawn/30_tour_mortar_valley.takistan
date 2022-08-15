if ("TOUR_objCiv" call A2S_taskState != "failed") then
{
	["TOUR_objCiv", "SUCCEEDED"] call A2S_setTaskState;
	"TOUR_objCiv" call A2S_taskCommit;
	sleep 2;
	"TOUR_objCiv" call A2S_taskHint;
	sleep 3;
};

[
	[],
	{
		if (!isDedicated) then
		{
			enableRadio true;
			sleep 2;
			TOUR_HQ sideChat "All elements be advised, the mortar fire has ceased!";
			sleep 3;
			TOUR_HQ sideChat "Proceed with the assault. Great job Nomad! OUT";
			sleep 2;
			enableRadio false;
		};
	}
] remoteExec ["spawn", 0, false];

if ("TOUR_objMortars" call A2S_taskState != "SUCCEEDED") then
{
	["TOUR_objMortars", "failed"] call A2S_setTaskState;
	"TOUR_objMortars" call A2S_taskCommit;
	sleep 2;
	"TOUR_objMortars" call A2S_taskHint;
};

sleep 7;

if ("TOUR_objCiv" call A2S_taskState == "SUCCEEDED") then
{
	"complete" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
}else
{
	"PARTIAL" remoteExecCall ["BIS_fnc_endMissionServer", 0, true];
};
