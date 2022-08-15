private 
[
	"_display", "_map", 
	"_textHelp", "_textSupportType", "_textUnit", "_textType", "_textAmountHeight", "_textRadius", "_textIntSpeed", "_textBehaviour",
	"_buttonExecute", "_buttonEnd", "_buttonInfo", "_buttonConfirm", "_buttonReject",
	"_comboSupport", "_comboType", "_comboUnit", "_comboBehaviour",
	"_sliderAmountHeight", "_SliderRadius", "_SliderIntSpeed",
	"_supportType", "_commandType", "_textInfo", "_ammoclass", "_ammoText", "_ammotype", "_ammo", "_text1", "_arrayHeli", "_groupID"
];

_display = findDisplay 121220;

_textHelp = _display displayCtrl 121221;
_textSupportType = _display displayCtrl 121222;
_textUnit = _display displayCtrl 121223;
_textType = _display displayCtrl 121224;
_textAmountHeight = _display displayCtrl 121225;
_textRadius = _display displayCtrl 121226;
_textIntSpeed = _display displayCtrl 121227;
_textBehaviour = _display displayCtrl 121228;

_map = _display displayCtrl 121230;
_buttonExecute = _display displayCtrl 121231;
_buttonEnd = _display displayCtrl 121232;
_buttonInfo = _display displayCtrl 121233;
_buttonConfirm = _display displayCtrl 121234;
_buttonReject = _display displayCtrl 121235;

_comboSupport = _display displayCtrl 121240;
_comboUnit = _display displayCtrl 121241;
_comboType = _display displayCtrl 121242;
_comboBehaviour = _display displayCtrl 121246;

_sliderAmountHeight = _display displayCtrl 121243;
_SliderRadius = _display displayCtrl 121244;
_SliderIntSpeed = _display displayCtrl 121245;

_index = _this select 1;
_commandType = (_comboType lbText _index);
_supportType = _comboSupport lbText (lbCurSel _comboSupport);

disableSerialization;

if (!isNil {TOUR_SI_core getVariable "TOUR_SI_inuse"}) exitWith
{
	_textHelp ctrlSetStructuredText parseText
	"
		<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>COMMUNICATIONS BUSY</t>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Support Services Already In Use! Please Try Again Later.</t>
	";
	{_x ctrlEnable false}forEach [_buttonExecute, _buttonEnd, _buttonInfo, _buttonConfirm, _buttonReject, _comboSupport, _comboType, _comboUnit, _comboBehaviour, _sliderIntSpeed, _sliderAmountHeight, _sliderRadius, _sliderIntSpeed];
};

TOUR_SI_pressed_once = nil;
TOUR_SI_pressed_once_end = nil;

switch (toLower _supportType) do
{
	case "artillery":
	{
		
		if(_commandType == "nothing") exitWith 
		{
			["error", "No shells of that type found!"] call TOUR_SI_fnc_hint;
		};

		_ammotext = switch (toLower _commandType) do
		{
				case "155mm he rounds": {"32rnd_155mm_mo_shells"};
				case "82mm he rounds": {"8rnd_82mm_mo_shells"};
				case "82mm flare rounds": {"8rnd_82mm_mo_flare_white"};
				case "82mm smoke rounds": {"8rnd_82mm_mo_smoke_white"};
				case "82mm guided rounds": {"8rnd_82mm_mo_guided"};
				case "82mm laser guided rounds": {"8rnd_82mm_mo_lg"};
				case "155mm smoke rounds": {"6rnd_155mm_mo_smoke"};
				case "155mm guided rounds":	{"2rnd_155mm_mo_guided"};
				case "155mm laser guided rounds": {"2rnd_155mm_mo_lg"};
				case "155mm mine rounds": {"6rnd_155mm_mo_mine"};
				case "155mm at mine rounds": {"6rnd_155mm_mo_at_mine"};
				case "155mm cluster rounds": {"2rnd_155mm_mo_cluster"};
				default {""};
		};

		{
			if (_ammotext == _x select 0) exitWith 
			{ 
				_ammoclass = _x;
			};
			
		}forEach (TOUR_SI_core getVariable "TOUR_SI_ammo");

		_ammotype = _ammoclass select 0;
		_ammo = _ammoclass select 1;

		if (_ammo < 1) exitWith
		{
			_sliderAmountHeight sliderSetRange [0, -1];
			_sliderAmountHeight sliderSetPosition 0;
			{_x ctrlEnable false}forEach [_sliderAmountHeight,_sliderRadius, _sliderIntSpeed, _buttonExecute];
			
			_textHelp ctrlSetStructuredText parseText format [
			"
				<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa'/> <t size='1.25' font='puristaMedium'>ARTILLERY SUPPORT</t>
				<br/>
				<br/>
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>SHELL TYPE: %1</t>
				<br/>
				<br/>
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>There are no rounds left for this shell type. Please select another type of round.</t>
			", _commandType];
		};

		_sliderAmountHeight sliderSetRange [1, _ammo];
		_SliderIntSpeed sliderSetRange [3, 60];
		_SliderRadius sliderSetRange [0, 300];
		
		_sliderAmountHeight sliderSetPosition 0;
		_sliderRadius sliderSetPosition 0;
		_sliderIntSpeed sliderSetPosition 0;
		
		{
			_x ctrlShow true;
		}forEach 	[_buttonExecute, 
					_comboType,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed,
					_textType, _textAmountHeight, _textRadius, _textIntSpeed];

		{
			_x ctrlShow false;
		}forEach 	[_buttonConfirm, _buttonReject,
					_comboUnit, _comboBehaviour,
					_textUnit, _textBehaviour];

		{
			_x ctrlEnable true;
		}forEach 	[_comboType, _sliderAmountHeight, _sliderRadius, _sliderIntSpeed];
		
		{
			_x ctrlEnable false;
		}forEach 	[_buttonExecute, _buttonConfirm, _buttonReject,
					_comboUnit, _comboBehaviour];		

		_text2 = (round sliderPosition _sliderAmountHeight);

		_text3 = (round sliderPosition _sliderRadius);

		_text4 = (round sliderPosition _sliderIntSpeed);
		
		_textInfo = format [
		"
			<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa'/> <t size='1.25' font='puristaMedium'>ARTILLERY SUPPORT</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>SHELL TYPE: %1</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>ROUNDS: %2</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>DISPERSION: %3m</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>INTERVAL: %4s</t>
		", _commandType, _text2, _text3, _text4];
	};
	
	case "helicopter":
	{
		_groupID = (_comboUnit lbText (lbCurSel _comboUnit));
		
		_sliderAmountHeight sliderSetRange [30, 1000];
		_SliderIntSpeed sliderSetRange [0, 2];
		_SliderRadius sliderSetRange [50, 500];
		
		_sliderAmountHeight sliderSetPosition 0;
		_sliderRadius sliderSetPosition 0;
		_sliderIntSpeed sliderSetPosition 0;
		
		_text2 = (round sliderPosition _sliderAmountHeight);

		_text3 = (round sliderPosition _sliderRadius);

		_text4 = 	switch (round sliderPosition _sliderIntSpeed) do
					{
						case 0: {"Limited"};
						case 1: {"Normal"};
						case 2: {"Full"};
						default {"Error!"};
					};
		
		_text5 = (_comboBehaviour lbText (lbCurSel _comboBehaviour));
	
		{
			_x ctrlShow true;
		}forEach 	[_buttonExecute, _buttonConfirm, _buttonReject,
					_comboUnit, _comboType, _comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed,
					_textType, _textAmountHeight, _textRadius, _textIntSpeed, _textUnit, _textBehaviour];
					
		{
			_x ctrlShow false;
		}forEach 	[];
			
		{
			_x ctrlEnable true;
		}forEach 	[_buttonExecute,
					_comboUnit, _comboType, _comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed];

		{
			_x ctrlEnable false;
		}forEach 	[_buttonConfirm, _buttonReject];	
	
		//text help
		_textInfo =
		format ["
			<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconhelicopter_ca.paa'/> <t size='1.25' font='puristaMedium'>HELICOPTER SUPPORT</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>UNIT: %1</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>ORDERS: %2</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>FLIGHT HEIGHT: %3</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>PATROL RADIUS: %4</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>FLIGHT SPEED: %5</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>BEHAVIOUR: %6</t>
		", 
		_groupID, _commandType, _text2, _text3, _text4, _text5];
		
		if !(toLower _commandType in ["circle", "cas", "cas (laser designation)"]) then
		{
			{
				_x ctrlEnable false;
			}forEach 	[_sliderRadius];
		};
		
		if (toLower _commandType in ["cas", "cas (laser designation)"]) then
		{
			{
				_x ctrlEnable false;
			}forEach 	[_comboBehaviour, _sliderIntSpeed];
		};
	};
	
	case "plane":
	{
		_groupID = (_comboUnit lbText (lbCurSel _comboUnit));
		
		_sliderAmountHeight sliderSetRange [100, 5000];
		_SliderIntSpeed sliderSetRange [0, 2];
		_SliderRadius sliderSetRange [500, 2000];
		
		_sliderAmountHeight sliderSetPosition 0;
		_sliderRadius sliderSetPosition 0;
		_sliderIntSpeed sliderSetPosition 0;
		
		_text2 = (round sliderPosition _sliderAmountHeight);

		_text3 = (round sliderPosition _sliderRadius);

		_text4 = 	switch (round sliderPosition _sliderIntSpeed) do
					{
						case 0: {"Limited"};
						case 1: {"Normal"};
						case 2: {"Full"};
						default {"Error!"};
					};
		
		_text5 = (_comboBehaviour lbText (lbCurSel _comboBehaviour));
	
		{
			_x ctrlShow true;
		}forEach 	[_buttonExecute,
					_comboUnit, _comboType, _comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed,
					_textType, _textAmountHeight, _textRadius, _textIntSpeed, _textUnit, _textBehaviour];
					
		{
			_x ctrlShow false;
		}forEach 	[_buttonConfirm, _buttonReject];
			
		{
			_x ctrlEnable true;
		}forEach 	[_buttonExecute,
					_comboUnit, _comboType, _comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed];

		{
			_x ctrlEnable false;
		}forEach 	[_buttonConfirm, _buttonReject];	
	
		//text help
		_textInfo =
		format ["
			<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconplane_ca.paa'/> <t size='1.25' font='puristaMedium'>PLANE SUPPORT</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>UNIT: %1</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>ORDERS: %2</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>FLIGHT HEIGHT: %3</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>PATROL RADIUS: %4</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>FLIGHT SPEED: %5</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>BEHAVIOUR: %6</t>
		", 
		_groupID, _commandType, _text2, _text3, _text4, _text5];
		
		if !(toLower _commandType in ["circle", "cas", "cas (laser designation)"]) then
		{
			{
				_x ctrlEnable false;
			}forEach 	[_sliderRadius];
		};
		
		if (toLower _commandType in ["cas", "cas (laser designation)"]) then
			{
		{
				_x ctrlEnable false;
			}forEach 	[_comboBehaviour, _sliderIntSpeed];
		};
	};
};

//Help Text
_textHelp ctrlSetStructuredText parseText _textInfo;

//enable position select
_map ctrlSetEventHandler ["MouseButtonClick", "_this call TOUR_SI_fnc_onMapClicked"];

_mkrnumber = 1;
while {!(str (getMarkerPos (format ["TOUR_SI_marker_%1", _mkrnumber])) == "[0,0,0]")} do
{
	deleteMarkerLocal format ["TOUR_SI_marker_%1", _mkrnumber];
	_mkrnumber = _mkrnumber + 1;
};