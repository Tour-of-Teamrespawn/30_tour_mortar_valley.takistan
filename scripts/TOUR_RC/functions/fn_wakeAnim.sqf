if (isDedicated) exitWith {};
sleep 0.5;
_this switchMove "acts_InjuredLyingRifle01";  
sleep 8;  
if (alive _this) then  
{
	if (local _this) then
	{
		_this setDir ((getDir _this) +  180);
	};
	_this switchMove "AinjPpneMstpSnonWnonDnon_rolltofront";
};  
sleep 2;  
if (alive _this) then  
{
	_this switchMove "AmovPpneMstpSnonWnonDnon_AmovPercMstpSnonWnonDnon";
};