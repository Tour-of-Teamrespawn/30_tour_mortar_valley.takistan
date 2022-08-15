if (isDedicated) exitWith {};
waitUntil {player == player};
private ["_respawntype", "_lives", "_lock", "_side", "_ticketsNew", "_ticketsOld", "_update"];

_side = (player getVariable "TOUR_RC_side");
_ticketsOld = [(player getVariable "TOUR_RC_side")]call BIS_fnc_respawnTickets;

_update = 
{	
	params ["_ticketsNew"];
	
	_respawntype = format ["- Player respawn has been enabled for this mission. You will respawn after %1 seconds, after you have died.", (missionNameSpace getVariable "TOUR_RC_respawnTime")];

	_lives = format ["- The number of lives remaining for your side are %1.", _ticketsNew];

	_lock = "- The Admin of the server can also lock slots to existing players, and prevent new joiners, allowing existing players to rejoin in their origional slots if they disconnect. This can be done by opening the control dialog and pressing the lock/unlock button. When the slots are unlocked, it WILL allow waiting new joiners to enter the game from spectating.";

	player createDiarySubject ["About", "About"];

	if (!isNil "TOUR_RC_DiaryRecord") then
	{
		player removeDiaryRecord ["About", TOUR_RC_DiaryRecord];
	};

	TOUR_RC_DiaryRecord = player createDiaryRecord  ["About", ["Tour Respawn Control", 
	format ["
		<br/>
	Developer: Mr.Ben
		<br/>
	Version: 11
		<br/>
	Credits: Thanks to all other Tour members for testing and feedback.
		<br/>
		<br/>
		<br/>
	%1
		<br/>
		<br/>
	%2
		<br/>
		<br/>
	- When the unit you are playing / or player has ran out of lives, you will be sent to a perminant spectating mode and join a spectating group, till the end of the mission.
		<br/>
		<br/>
	- The Admin of the server, will be able to reset and select new respawn parameters at any time. To do this press Control + Alt + F12, to bring up the control dialog. To respawn a player select a player name, and press COMMIT. To reset parameters, select a respawn time, lives and press COMMIT to execute changes. You also have the option to clear dead UIDs - this will allow dead players to respawn when resetting parameters.
		<br/>
		<br/>
	%3
		<br/>
		<br/>
	", _respawntype, _lives, _lock]]];
};

[_ticketsOld] call _update;

while {true} do
{
	_ticketsNew = [(player getVariable "TOUR_RC_side")]call BIS_fnc_respawnTickets;
	if !(_ticketsOld == _ticketsNew) then
	{
		[_ticketsNew] call _update;
	};
	_ticketsOld = _ticketsNew;
	sleep 1;
};
