sleep 5;
while {alive player} do
{
	_shell = "sh_155mm_amos" createVehicle [((getPosATL (vehicle player)) select 0), ((getPosATL (vehicle player)) select 1), 50];
	_shell setVectorUp [-1, 0, 0];
	_shell setVelocity [0, 0, -50];
	sleep 7;
};