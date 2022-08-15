_start = getMarkerPos "TOUR_mkrSector_1";
_value = 0;
for "_i" from 2 to 5 do
{	
	_value = _value + 400;
	_newPos = _start getPos [_value, 23.84];
	(format ["TOUR_mkrSector_%1", _i]) setMarkerPosLocal _newPos;
	if (_i == 3) then
	{
		"TOUR_mkrAO" setMarkerPosLocal _newPos;
	};
};
"TOUR_mkrdeadZone_2" setMarkerPosLocal ((getMarkerPos "TOUR_mkrSector_3") getPos [400, 113.84]);
"TOUR_mkrdeadZone_1" setMarkerPosLocal ((getMarkerPos "TOUR_mkrSector_3") getPos [400, 293.84]);

if (!isDedicated) then
{
	TOUR_deadZone_1 = createTrigger ["EmptyDetector", getMarkerPos "TOUR_mkrdeadZone_1"];
	TOUR_deadZone_1 setTriggerArea [1500, 100, 293.84, true];
	TOUR_deadZone_1 setTriggerActivation ["WEST", "PRESENT", false];
	TOUR_deadZone_1 setTriggerStatements ["(vehicle player) in thisList", "execVM ""scripts\control\deadZone.sqf"";", ""];

	TOUR_deadZone_2 = createTrigger ["EmptyDetector", getMarkerPos "TOUR_mkrdeadZone_1"];
	TOUR_deadZone_2 setTriggerArea [1500, 100, 113.84, true];
	TOUR_deadZone_2 setTriggerActivation ["WEST", "PRESENT", false];
	TOUR_deadZone_2 setTriggerStatements ["(vehicle player) in thisList", "execVM ""scripts\control\deadZone.sqf"";", ""];
};