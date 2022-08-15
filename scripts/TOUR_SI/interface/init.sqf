waitUntil { !isNil { BIS_fnc_init } };

private ["_functions"];
_functions = [] execVM "scripts\TOUR_SI\interface\functions\fn_init.sqf";
waitUntil {scriptDone _functions};

TOUR_SI_enable_SI = _this select 2;
TOUR_SI_enable_config = _this select 3;

if (!isDedicated) then
{		
	//Actions
	player addAction ["<t color=""#D7DF01"">"+"SUPPORT INTERFACE", "scripts\TOUR_SI\interface\action.sqf", "", 0, false, true, "", TOUR_SI_enable_SI];
	player addEventHandler ["Respawn" ,{player addAction ["<t color=""#D7DF01"">"+"SUPPORT INTERFACE", "scripts\TOUR_SI\interface\action.sqf", "", 0, false, true, "", TOUR_SI_enable_SI];}];
	
	player addAction ["<t color=""#D7DF01"">"+"SUPPORT INTERFACE SETUP", "scripts\TOUR_SI\interface\actionSetup.sqf", "", 0, false, true, "", TOUR_SI_enable_config];
	player addEventHandler ["Respawn" ,{player addAction ["<t color=""#D7DF01"">"+"SUPPORT INTERFACE SETUP", "scripts\TOUR_SI\interface\actionSetup.sqf", "", 0, false, true, "", TOUR_SI_enable_config];}];
};
