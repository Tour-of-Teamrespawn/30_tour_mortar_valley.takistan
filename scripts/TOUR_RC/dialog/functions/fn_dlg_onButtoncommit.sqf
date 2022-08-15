private ["_display", "_combolives", "_slidertime", "_combotype", "_type", "_tickets", "_comboplayer", "_playername", "_player"];
_display = findDisplay 201800;
_playername = "";
_comboplayer = _display displayCtrl 201809;
_playername = toLower (_comboplayer lbText (lbCurSel _comboplayer));
if (_playername != "") then
{
	//respawn player
	if (_playername == "") exitWith
	{
		["warning", "You need to select a player"] call TOUR_RC_fn_hint;
	};
	
	{
		if (_playername == name _x) exitWith
		{
			_player = _x;
		};
	}forEach (playableUnits + switchableUnits + alldead);
	
	[_playername, {_this call TOUR_RC_dlg_fnc_player_admin_respawn}] remoteExecCall ["spawn", 0, false];
	_i = [_playername, _player] spawn
	{
		_playername = _this select 0;
		_player = _this select 1;
		_deadUIDs = missionNameSpace getVariable "TOUR_RC_deadUIDs";
		_deadUIDs = _deadUIDs - [(getPlayerUID _player)];
		missionNameSpace setVariable ["TOUR_RC_deadUIDs", _deadUIDs, true];
		["info", (format ["Respawning %1, please wait...",_playername])] call TOUR_RC_fn_hint;
		waitUntil {({(_player == _x)}count alldead == 0)};
		["info", (format ["%1 has now respawned",_playername])] call TOUR_RC_fn_hint;
	};
}else
{
	//respawn params change
	_combolives = _display displayCtrl 201803;
	_slidertime = _display displayCtrl 201804;
	_combotype = _display displayCtrl 201805;
	
	_type = toLower (_combotype lbText (lbCurSel _combotype));
	if (_type == "") exitWith
	{
		["warning", "You need to select whether to clear UIDs or not"] call TOUR_RC_fn_hint;
	};

	_tickets = (_combolives lbText (lbCurSel _combolives));	
	if (_tickets == "") exitWith
	{
		["warning", "You need to select a number of lives"] call TOUR_RC_fn_hint;
	};
	
	_time = (round sliderPosition _slidertime);

	_tickets = switch (toLower _tickets) do
	{
		case "1": {1};
		case "2": {2};
		case "3": {3};
		case "4": {4};
		case "5": {5};
		case "6": {6};
		case "7": {7};
		case "8": {8};
		case "9": {9};
		case "10": {10};
		case "20": {20};
		case "30": {30};
		case "40": {40};
		case "50": {50};
		case "100": {100};
		default {1};
	};
	
	_lives = [_tickets, _tickets, _tickets, _tickets];
	
	_clear = switch (_type) do
	{
		case "clear":
		{
			true
		};
		case "do not clear":
		{
			false
		};
	};
	
	[_lives, _time, _clear, false] call TOUR_RC_fn_setParams;

["info", format ["New Parameters:
<br/>
<br/>		
Lives: %1
<br/>
Respawn Delay: %2 s
	", _tickets, _time]] call TOUR_RC_fn_hint;
};
[]call TOUR_RC_dlg_fnc_onUnload;