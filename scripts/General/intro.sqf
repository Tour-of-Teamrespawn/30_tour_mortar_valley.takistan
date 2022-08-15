if (!isdedicated) then
{
	if (time > 5) exitWith
	{
		execVM "scripts\general\dust.sqf";
	};
	cutText ["Loading Intro","BLACK FADED", 0];
	0 fadeSound 0;
	waituntil {player == player};
	playSound "TOUR_introMusic";
	sleep 1;
	_pos1  = [6531.3213,11653.961, 20];
	_pos2  = [5525.5859 ,9251.0518, 20];
	_pos3  = [getPosATL player select 0, getPosATL player select 1, 2];
	
	_cam1 = "camera" camCreate _pos1;
	_cam1 camprepareTarget _pos3; 
	_cam1 camCommitprepared 0;
	_cam1 cameraEffect ["internal", "back"];
	
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [5];
	"dynamicBlur" ppEffectCommit 0;
	
	sleep 6;
	_cam1 camSetPos _pos2;
	_cam1 camCommit 30;
	sleep 1;

	cutText [" ","BLACK IN", 5];
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 8;
	5 fadeSound 1;

	[]spawn 
	{

		sleep 10;
 		_text = ["R","a","s","m","a","n"," ","V","a","l","l","e","y","\n","T","a","k","i","s","t","a","n"];
 		_display = "";
 		_pointer = 0;
 		_sleepTime = 0.1;
 		while {_pointer < count _text} do
 		{
			_sleepTime = 0.1 + (random 0.1);
 		 	_display = _display + (_text select _pointer);
 		 	titleText [_display,"PLAIN down",_sleepTime];
 		 	_pointer = _pointer + 1;
 		 	if (_pointer == count _text) then
  			{
 	  			cutText [_display,"PLAIN down",1];
  			}
  			else
  			{
   				playSound "TOUR_key_noise";
  			};
 			sleep _sleepTime;
		};		

	};
		
	sleep 22;
	cutText [" ","BLACK OUT", 2];
	sleep 3;
	_cam1 cameraEffect ["TERMINATE", "back"];
	camdestroy _cam1;
	"dynamicBlur" ppEffectAdjust [5];
	"dynamicBlur" ppEffectCommit 3;
	sleep 1;	
		
	_date = date;
	_year = _date select 0;
	_month = _date select 1;
	_day = _date select 2;
	_hour = _date select 3;
	_min = _date select 4;
	_text_date = [];

	if (_min < 10) then 
	{ 
		_text_date = format ["%1-%2-%3  %4h0%5m", _month, _day, _year, _hour, _min]; 
	} 
	else 
	{  
		if (_min == 60) then
		{
			_hour = _hour + 1;
			_min = 0;
			_text_date = format ["%1-%2-%3  %4h0%5m", _month, _day, _year, _hour, _min];
		}
		else
		{
			_text_date = format ["%1-%2-%3  %4h%5m", _month, _day, _year, _hour, _min]; 
		};
	};

	_text_1 = "Takistan";
	_text_2 = "[Tour] Mortar Valley";
	sleep 2;
	[_text_1, _text_date, _text_2] execVM "scripts\general\fn_infoText.sqf";
	sleep 2.5;
	player playAction "stand";
	sleep 2.5;
	cutText ["", "BLACK IN", 5];
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 3;
	sleep 3;
	execVM "scripts\general\dust.sqf";
};