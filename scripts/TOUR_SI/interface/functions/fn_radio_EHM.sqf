private ["_positions", "_rounds", "_amount", "_radius", "_interval", "_unit", "_groupstring", "_groupunit", "_ammo", "_strPos"];
	
_positions = _this select 0;
_type = _this select 1;
_height = _this select 2;
_radius = _this select 3;
_speed = _this select 4;
_behaviour = _this select 5;
_unitarray = _this select 6;
_unit = _this select 7;

_groupstring = (str group _unit) call TOUR_SI_fnc_groupNameFix;
_groupunit = (str (_unitarray select 0)) call TOUR_SI_fnc_groupNameFix;

if (!isDedicated) then
{
	enableRadio true;
	sleep 1;
	_unit sideChat format ["%2 this is %1, how copy? OVER", _groupstring, _groupunit];
	sleep 3;
	if (alive (leader (_unitarray select 0))) then
	{
		(leader (_unitarray select 0)) sideChat format ["This is %2 we read you %1, go ahead. OVER", _groupstring, _groupunit];
	};
	sleep 3;
	if (_type == "return to base") then
	{
		_strPos = "Base";
	}else
	{
		_strPos = (_positions select ((count _positions) - 1)) call TOUR_SI_fnc_gridFix;
	};
	if (alive (leader (_unitarray select 0))) then
	{
		switch (toLower _type) do
		{
			case "circle": {_unit sideChat format ["%2, we require you to move to %3. OVER", _groupstring, _groupunit, _strPos];};
			case "move to": {_unit sideChat format ["%2, we require you to move to %3. OVER", _groupstring, _groupunit, _strPos];};
			case "move to (route)": {_unit sideChat format ["%2, we require you to move through a route to %3. OVER", _groupstring, _groupunit, _strPos];};
			case "land": {_unit sideChat format ["%2, we require you to land at %3. OVER", _groupstring, _groupunit, _strPos];};
			case "land (engine off)": {_unit sideChat format ["%2, we require you to land at %3. OVER", _groupstring, _groupunit, _strPos];};
			case "return to base": {_unit sideChat format ["%2, return to base. OVER", _groupstring, _groupunit, _strPos];};
			case "pickup": {_unit sideChat format ["%2, we require immediate EVAC at %3! OVER", _groupstring, _groupunit, _strPos];};
			case "cas": {_unit sideChat format ["%2, we require immediate close air support at %3! OVER", _groupstring, _groupunit, _strPos];};
		};
	};
	sleep 1;
	enableRadio false;
}else
{
	sleep 8;
};

if (isServer) then
{
	(_unitarray select 1) setVariable ["TOUR_SI_unitOrders", [_positions, _type, _height, _radius, _speed, _behaviour]];
	TOUR_SI_core setVariable ["TOUR_SI_inUse", nil, true];
};