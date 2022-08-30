/* 
###MISSION_VERSION 2.0
*/

_d = execVM "scripts\debugRPT.sqf";
waitUntil {scriptDone _d};

_p = execVM "params.sqf";
waitUntil {scriptDone _p};

_a = TOUR_Core execVM "a2s_multitask.sqf";
waitUntil {scriptDone _a};
TOUR_IED_jammers = [];
TOUR_IED_triggermen = [];

setViewDistance 2500;

enableRadio false;
{
	_x setVariable ["BIS_noCoreConversations",true];
} forEach allUnits;

TOUR_HQ = [WEST, "HQ"];

_fn = execVM "scripts\functions\functions_init.sqf";
waitUntil {scriptDone _fn};

_si = 
[
	TOUR_core,
	WEST,
	"(alive player) && ([player, ""ACRE_PRC148""] call acre_api_fnc_hasKindOfRadio)",
	"false",
	1,
	[
		[
			"artillery",
			"Stampede",
			[
				["8rnd_82mm_mo_flare_white", 10],
				["8rnd_82mm_mo_smoke_white", 30]
			]
		]
	],
	"TOUR_fnc_endRadio",
	{{(alive _x) && ((getMarkerPos "TOUR_mkrStart") distance _x > 200)}count (playableUnits + switchableUnits) == 0}
] execVM "scripts\TOUR_SI\TOUR_SI_init.sqf";

_ao = execVM "scripts\control\setupAO.sqf";
waitUntil {scriptDone _ao};

setwind [0.201112,0.204166,true];

if (isServer) then
{	
	_g = execVM "scripts\control\garbageLoop.sqf";

	_m = execVM "scripts\control\setupMortars.sqf";
	waitUntil {scriptDone _m};
	
	_o = execVM "scripts\control\setupObjectives.sqf";
	waitUntil {scriptDone _o};
	
	_s = execVM "scripts\control\setupSectors.sqf";
	waitUntil {scriptDone _s};

	_cp = ["TOUR_mkrAO"] execVM "scripts\ambientLife\createPedestrians.sqf";
	
	_cd = 5 execVM "scripts\ambientLife\createVehicles.sqf";
	
	_cd = 5 execVM "scripts\ambientLife\createVehicles.sqf";
	
	_eh = ["TOUR_mkrAO", EAST, 18, 25] execVM "scripts\control\setupEnemyHouse.sqf";
	
	_e =  execVM "scripts\control\setupEnemy.sqf";
	
	execVM "scripts\control\endingDead.sqf";
};


if (!isDedicated) then
{
	[] call A2S_tasksSync;
	
	#include "briefing.hpp";

	doStop player;
	
	[] execVM "scripts\TOUR_IED\init.sqf";
	
	_l = player execVM "scripts\loadouts\init.sqf";
	waitUntil {scriptDone _l};
	
	execVM "scripts\general\intro.sqf";
	
	doStop player;
};




