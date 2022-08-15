while {true} do
{
	{
		[_x] call TOUR_RC_fn_check;
	}forEach [WEST, EAST, INDEPENDENT, CIVILIAN];
	sleep 1;
};