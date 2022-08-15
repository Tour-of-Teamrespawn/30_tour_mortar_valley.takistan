if (!isdedicated) then
{
	waituntil {player == vehicle player};
	setwind [0.201112,0.204166,true];
	while {true} do 
	{
		waituntil {alive player};
		_inside = false;
		{
			if (_x isKindof "House") then {_inside = true};
		}forEach (lineIntersectsObjs [eyepos player, [eyepos player select 0, eyepos player select 1, 10], objnull, vehicle player, true, 32]);
		if !(_inside) then
		{
			_obj = vehicle player;
			_pos = [getPosATL _obj select 0, getPosATL _obj select 1, 0.01];
			_ran = ceil random 5;
			if (vehicle player == player) then
			{
				playsound format ["wind%1",_ran];
			};
			//setwind [0.201112*2,0.204166*2,false];
			_velocity = [random 10,random 10,-1];
			_color = [1.0, 0.9, 0.8];
			_alpha = 0.02 + random 0.02;
			_ps = "#particlesource" createVehicleLocal _pos;  
			_ps setParticleParams [["\Ca\Data\ParticleEffects\Universal\universal.p3d", 16, 12, 8], "", "Billboard", 1, 3, [0, 0, -6], _velocity, 1, 1.275, 1, 0, [9], [_color + [0], _color + [_alpha], _color + [0]], [1000], 1, 0, "", "", _obj];
			_ps setParticleRandom [3, [30, 30, 0], [0, 0, 0], 1, 0, [0, 0, 0, 0.01], 0, 0];
			_ps setParticleCircle [0.5, [0, 0, 0]];
			_ps setDropInterval 0.0005;
			sleep (random 1);
			deletevehicle _ps;
		};
		_delay = 15 + (random 15);
		sleep _delay;
	};
};