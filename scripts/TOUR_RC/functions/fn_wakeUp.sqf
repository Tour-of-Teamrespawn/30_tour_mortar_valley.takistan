[player, {_this call TOUR_RC_fn_wakeAnim}] remoteExec ["spawn", 0, false];

titleText ["", "BLACK OUT", 0.01];
sleep 0.5;
0 fadeSound 0;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [5];
"dynamicBlur" ppEffectCommit 1;
sleep 2;
titleText ["", "BLACK IN", 5];
5 fadeSound 1;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit 7;
sleep 7;
"dynamicBlur" ppEffectEnable false;

if !((primaryWeapon player) == "") then
{
	player selectWeapon (primaryWeapon player);		
}else
{
	if !((secondaryWeapon player) == "") then
	{
		player selectWeapon (secondaryWeapon player);	
	};		
};