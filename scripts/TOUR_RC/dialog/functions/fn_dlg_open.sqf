private ["_control", "_key", "_shift", "_ctrl", "_alt"];
_control = _this select 0;
_key = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;

if (isMultiplayer) then
{
	if (
			((isClass(configFile>>"CfgPatches">>"TOUR_adminConsole"))or(serverCommandAvailable "#kick"))&&
			(_key == 88)
			&& !(_shift)&&(_ctrl)&&(_alt)
	) then
	{
//		if (dialog) exitWith {};
		createDialog "TOUR_RC_dlg_adminTool";
	};
}else
{
	if (
			(_key == 88)
			&& !(_shift)&&(_ctrl)&&(_alt)
	) then
	{
//		if (dialog) exitWith {};
		createDialog "TOUR_RC_dlg_adminTool";
	};
};