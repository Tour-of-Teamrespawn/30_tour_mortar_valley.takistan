private ["_exp", "_type"];
_type = "Sh_155mm_AMOS";
_ied = _this;
_pos = getPosATL _ied;
deleteVehicle _ied;
if ((_ied isKindOf "IEDLandBig_F")or(_ied isKindOf "IEDUrbanBig_F")) then
{
	if ((floor (random 4)) < 4) then
	{
		_type = "Sh_155mm_AMOS";
	}else
	{
		_type = "Sh_82mm_AMOS";
	};
	if (!isNil "TOUR_IEDtest") then
	{
		_type = "SmokeShellRed";
	};
}else
{
	if ((floor (random 2)) == 1) then
	{
		_type = "Sh_82mm_AMOS";
	}else
	{
		_type = "R_80mm_HE";
	};
	if (!isNil "TOUR_IEDtest") then
	{
		_type = "SmokeShellRed";
	};
};
_exp = createVehicle [_type, [_pos select 0, _pos select 1, 0.3], [], 0, "NONE"];
_exp setPosATL [_pos select 0, _pos select 1, 0.3];
_exp setVectorUp [-1, 0, 0];
if (!isNil "TOUR_IEDtest") then
{
	hideobjectGlobal _exp;
}else
{
	_exp setVelocity [0,0,-100];
	TDMC_IED_detonated = true;
};

