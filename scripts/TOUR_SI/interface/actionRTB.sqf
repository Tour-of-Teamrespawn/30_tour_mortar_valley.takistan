if (alive driver (vehicle player)) then
{
	[player, {_this directSay "TOUR_SI_chatRTB";}] remoteExec ["BIS_fnc_spawn", 0, false];
	(vehicle player) setVariable ["TOUR_SI_vehicleChat", true, true];
	sleep 2;
	(vehicle player) setVariable ["TOUR_SI_unitOrders", [[], "return to base", 100, 0, "NORMAL", "WHITE"], true];
}else
{
	["warning", "The helicopter pilot is dead!"] call TOUR_SI_fnc_Hint;
};