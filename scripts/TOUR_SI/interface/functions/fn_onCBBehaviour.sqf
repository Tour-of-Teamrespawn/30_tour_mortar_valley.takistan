private 
[
	"_display", "_map", 
	"_textHelp", "_textSupportType", "_textUnit", "_textType", "_textAmountHeight", "_textRadius", "_textIntSpeed", "_textBehaviour",
	"_buttonExecute", "_buttonEnd", "_buttonInfo", "_buttonConfirm", "_buttonReject",
	"_comboSupport", "_comboType", "_comboUnit", "_comboBehaviour",
	"_sliderAmountHeight", "_SliderRadius", "_SliderIntSpeed",
	"_supportType", "_commandType", "_textInfo", "_ammoclass", "_ammoText", "_ammotype", "_ammo", "_text1", "_arrayHeli", "_groupID", "_position"
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

_commandType = (_comboType lbText (lbCurSel _comboType));
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
	{_x ctrlEnable false}forEach [_buttonExecute, _buttonEnd, _buttonInfo, _buttonConfirm, _buttonReject, _buttonRTB, _comboSupport, _comboType, _comboUnit, _comboSliderIntSpeed, _sliderAmountHeight, _SliderRadius, _SliderIntSpeed];
};

switch (toLower _supportType) do
{
	case "helictoper":
	{
		_groupID = (_comboUnit lbText (lbCurSel _comboUnit));

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
					_comboUnit, _comboType, _comboBehaviour, _comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed];

		{
			_x ctrlEnable false;
		}forEach 	[_buttonConfirm, _buttonReject];	


		//text help
		_textInfo = format ["
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
					_comboUnit, _comboType, _comboBehaviour, _comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed];

		{
			_x ctrlEnable false;
		}forEach 	[_buttonConfirm, _buttonReject];	


		//text help
		_textInfo = format ["
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

_textHelp ctrlSetStructuredText parseText _textInfo;
