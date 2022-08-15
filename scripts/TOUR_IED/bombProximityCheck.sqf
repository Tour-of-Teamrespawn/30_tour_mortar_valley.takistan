_ied = _this select 0;
_side = _this select 1;

while {(!isnull _ied)} do
{
	
	_near = nearestObjects [_ied, ["Man", "LandVehicle"], 50];
	
	//check if a person is near the IED and if a triggerman is within distance - goes bang
	if (({((vehicle _x) distance _ied < 100)&&(alive _x)} count TOUR_IED_Triggermen > 0) && ({(_x iskindof "Man")&&(side _x == _side)&&(_x distance _ied <= 15)} count _near > 0)) exitwith 
	{
		_ied execVM "scripts\TOUR_ied\bombDetonate.sqf";
	};

	//check if a person is too close to the IED and is too fast - goes bang
	if ( { ( sqrt((velocity _x select 0)^2 + (velocity _x select 1)^2) >= 1) && ((_x iskindof "Man")&&(side _x == _side)) && (_x distance _ied <= 5)}count _near > 0) exitwith 
	{
		_ied execVM "scripts\TOUR_ied\bombDetonate.sqf";
	};
	
	//check if a vehicle is too close to the IED - goes bang
	if ({(_x iskindof "LandVehicle") && (_x distance _ied <= 10) && (side (driver _x) == _side) }count _near > 0) then 
	{
		_ied execVM "scripts\TOUR_ied\bombDetonate.sqf";
	}else
	{
		//OR check to see if the vehicle is near the IED and a triggerman is within distance - goes bang
		if (({(_x iskindof "LandVehicle") && (_x distance _ied <= 15) && (side (driver _x) == _side)}count _near > 0)&&({((vehicle _x) distance _ied < 100)&&(alive _x)} count TOUR_IED_Triggermen > 0)) exitwith 
		{
			_ied execVM "scripts\TOUR_ied\bombDetonate.sqf";
		};
	};
	sleep 0.1;
};
