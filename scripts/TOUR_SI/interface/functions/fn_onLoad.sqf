private 
[
	"_display", "_map", 
	"_textHelp", "_textSupportType", "_textUnit", "_textType", "_textAmountHeight", "_textRadius", "_textIntSpeed", "_textBehaviour",
	"_buttonExecute", "_buttonEnd", "_buttonInfo", "_buttonConfirm", "_buttonReject",
	"_comboSupport", "_comboType", "_comboUnit", "_comboBehaviour",
	"_sliderAmountHeight", "_SliderRadius", "_SliderIntSpeed",
	"_textInfo"
];

_display = _this select 0;

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
_buttonReject = _display displayCtrl 121235;

_comboSupport = _display displayCtrl 121240;
_comboUnit = _display displayCtrl 121241;
_comboType = _display displayCtrl 121242;
_comboBehaviour = _display displayCtrl 121246;

_sliderAmountHeight = _display displayCtrl 121243;
_SliderRadius = _display displayCtrl 121244;
_SliderIntSpeed = _display displayCtrl 121245;

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
	{_x ctrlShow false}forEach [_buttonExecute, _buttonEnd, _buttonInfo, _buttonConfirm, _buttonReject, _comboSupport, _comboType, _comboUnit, _comboBehaviour, _sliderIntSpeed, _sliderAmountHeight, _sliderRadius, _sliderIntSpeed];
};

_textInfo = "
<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>SELECT SUPPORT REQUEST</t>
<br/>
<br/>
<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>SUPPORT TYPE: Use the options below to select a support type, then configure it and call it in.</t>
<br/>
<br/>";

{_x ctrlEnable false}forEach [_buttonExecute, _buttonConfirm, _buttonReject, _comboType, _comboUnit, _sliderIntSpeed, _sliderAmountHeight, _sliderRadius, _sliderIntSpeed, _comboBehaviour];
{_x ctrlShow false}forEach [_buttonExecute, _buttonConfirm, _buttonReject, _comboType, _comboUnit, _comboBehaviour, _sliderIntSpeed, _sliderAmountHeight, _sliderRadius, _sliderIntSpeed,
							_textUnit, _textType, _textAmountHeight, _textRadius, _textIntSpeed, _textBehaviour];

if (TOUR_SI_extraEnabled == 0) then
{
	{
		_x ctrlEnable false;
		_x ctrlShow false;
	}forEach [_buttonEnd, _buttonInfo];
}else
{
	if (TOUR_SI_extraEnabled == 1) then
	{
		//ending only
		{
			_x ctrlEnable true;
			_x ctrlShow true;
		}forEach [_buttonEnd];
		{
		_x ctrlEnable false;
		_x ctrlShow false;
		}forEach [_buttonInfo];
		_textInfo = _textInfo + "
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>REPORT IN: Press the END MISSION button in order to report back to base and end the mission.</t>
		";
	};
	if (TOUR_SI_extraEnabled == 2) then
	{
		//ending only
		{
			_x ctrlEnable true;
			_x ctrlShow true;
		}forEach [_buttonEnd, _buttonInfo];
		_textInfo = _textInfo + "
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>REPORT IN: Press the END MISSION button in order to report back to base and end the mission.</t>
		<br/>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>REQUEST INTEL: Press the REQUEST ENEMY INFO button in order to recieve a location of active enemy.</t> 
		";
	};
};

TOUR_SI_pressed_once = nil;
TOUR_SI_pressed_once_end = nil;

//Combo Support Type
lbClear _comboSupport;

if ((count (TOUR_SI_core getVariable "TOUR_SI_ammo")) > 0) then
{
	_comboSupport lbAdd "Artillery";
};
if ((count (TOUR_SI_core getVariable "TOUR_SI_Helicopters")) > 0) then
{
	_comboSupport lbAdd "Helicopter";
};
if ((count (TOUR_SI_core getVariable "TOUR_SI_Planes")) > 0) then
{
	_comboSupport lbAdd "Plane";
};

//Event Handlers
_buttonExecute ctrlSetEventHandler ["ButtonDown", "_this call TOUR_SI_fnc_onButtonExecute"];
_buttonConfirm ctrlSetEventHandler ["ButtonDown", "_this call TOUR_SI_fnc_onButtonConfirm"];
_buttonReject ctrlSetEventHandler ["ButtonDown", "_this call TOUR_SI_fnc_onButtonReject"];
_buttonEnd ctrlSetEventHandler ["ButtonDown", "_this call TOUR_SI_fnc_onButtonEnd"];
_buttonInfo ctrlSetEventHandler ["ButtonDown", "_this call TOUR_SI_fnc_onButtonInfo"];

_comboSupport ctrlSetEventHandler ["LBSelChanged", "_this call TOUR_SI_fnc_onCbSupport"];
_comboType ctrlSetEventHandler ["LBSelChanged", "_this call TOUR_SI_fnc_onCbType"];
_comboBehaviour ctrlSetEventHandler ["LBSelChanged", "_this call TOUR_SI_fnc_onCbBehaviour"];
_comboUnit ctrlSetEventHandler ["LBSelChanged", "_this call TOUR_SI_fnc_onCbUnit"];
_sliderAmountHeight ctrlSetEventHandler ["SliderPosChanged", "_this call TOUR_SI_fnc_onSliderAmountHeight"];
_sliderRadius ctrlSetEventHandler ["SliderPosChanged", "_this call TOUR_SI_fnc_onSliderRadius"];
_sliderIntSpeed ctrlSetEventHandler ["SliderPosChanged", "_this call TOUR_SI_fnc_onSliderIntSpeed"];


//Help Text
_textHelp ctrlSetStructuredText parseText _textInfo;