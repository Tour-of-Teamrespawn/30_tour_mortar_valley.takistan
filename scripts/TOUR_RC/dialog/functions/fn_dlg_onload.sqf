private ["_display", "_message", "_slothelp", "_combolives", "_slidertime", "_combotype", "_buttoncancel", "_buttoncommit", "_buttonslots", "_parray"];

_display = _this select 0;
_message = _display displayCtrl 201801;
_slothelp = _display displayCtrl 201802;
_combolives = _display displayCtrl 201803;
_slidertime = _display displayCtrl 201804;
_combotype = _display displayCtrl 201805;
_buttoncancel = _display displayCtrl 201806;
_buttoncommit = _display displayCtrl 201807;
_buttonslots = _display displayCtrl 201808;
_comboplayer = _display displayCtrl 201809;

disableSerialization;

if (missionNameSpace getVariable "TOUR_RC_Locked") then
{
	//locked slots
	_slothelp ctrlSetText "Slots Locked";
	_buttonslots ctrlSetText "Unlock Slots";
}else
{
	//locked slots
	_slothelp ctrlSetText "Slots Unlocked";
	_buttonslots ctrlSetText "Lock Slots";
};

if (TOUR_RC_AdminR) exitWith
{
	_message ctrlSetStructuredText parseText format
	["
	A reset of parameters is currently in effect, please reload again shortly.
	"];	
	{ _x ctrlEnable false } forEach [_combolives, _slidertime, _combotype, _buttonslots, _buttoncommit];
};
	

_message ctrlSetStructuredText parseText format
["
<br/>You may select new parameters, or a single player to respawn, and execute the changes by pressing the commit button.<br/>Beware, in resetting parameters, everyone will respawn!<br/><br/>You may also unlock slots, or lock slots to existing players, preventing new joiners.<br/>Unlocking slots WILL allow spectating players to spawn.
"];

	{ _x ctrlEnable true } forEach [_buttonslots, _buttoncommit];

lbClear _combolives; { _combolives lbAdd _x } forEach ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "20", "30", "40", "50", "100"];
_slidertime sliderSetRange [10, 1800]; _slidertime sliderSetspeed [0.1, 0.1]; _slidertime sliderSetPosition 10;
lbClear _combotype; { _combotype lbAdd _x } forEach ["Clear", "Do Not Clear"];

lbClear _comboplayer;
{
	if (!(alive _x) && (isNil {_x getVariable "TOUR_RC_spectator"})) then
	{
		_comboplayer lbAdd (name _x);
	};
}forEach allPlayers;


_combolives ctrlSetEventHandler ["LBSelChanged", "_this call TOUR_RC_dlg_fnc_onCombolives"];
_slidertime ctrlSetEventHandler ["SliderPosChanged", "_this call TOUR_RC_dlg_fnc_onSlidertime"];
_combotype ctrlSetEventHandler ["LBSelChanged", "_this call TOUR_RC_dlg_fnc_oncomboType"];
_comboplayer ctrlSetEventHandler ["LBSelChanged", "_this call TOUR_RC_dlg_fnc_oncomboPlayer"];
_buttoncommit ctrlSetEventHandler ["ButtonDown", "_this call TOUR_RC_dlg_fnc_onButtoncommit"];
_buttonslots ctrlSetEventHandler ["ButtonDown", "_this call TOUR_RC_dlg_fnc_onButtonslots"];