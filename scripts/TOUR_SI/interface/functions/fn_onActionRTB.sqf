if (alive driver (vehicle player)) then
{
	enableRadio true;
	sleep 1;
	_driver = (driver (vehicle player));
	if ((alive player) && (alive _driver)) then
	{
		[
			player,
			format ["Hey %1, we need to return to base!", name _driver],
			"vehicle"
		] call TOUR_SI_fnc_broadcastmessage;
	};
	
	sleep 1;
	[vehicle player] setVariable ["TOUR_SI_heliOrders", [[0,0,0], "return to base", 100, 0, "NORMAL", "WHITE"], true];
	sleep 2;
	
	if ((alive player) && (alive _driver)) then
	{
		[
			_driver,
			format ["Sure thing %1, buggin out. We are RTB.", name player],
			"vehicle"
		] call TOUR_SI_fnc_broadcastmessage;
	};	
	sleep 1;
	enableRadio false;

}else
{
	["warning", "The helicopter pilot is dead!"] call TOUR_SI_fnc_Hint;
};

