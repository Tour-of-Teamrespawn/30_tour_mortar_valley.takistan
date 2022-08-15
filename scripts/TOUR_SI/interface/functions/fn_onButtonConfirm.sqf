private 
[
	"_display", "_map", 
	"_textHelp", "_textSupportType", "_textUnit", "_textType", "_textAmountHeight", "_textRadius", "_textIntSpeed", "_textBehaviour",
	"_buttonExecute", "_buttonEnd", "_buttonInfo", "_buttonConfirm", "_buttonReject",
	"_comboSupport", "_comboType", "_comboUnit", "_comboBehaviour",
	"_sliderAmountHeight", "_SliderRadius", "_SliderIntSpeed",
	"_position", "_abort", "_end", "_buttonInfo", "_text1", "_text2", "_text3", "_text4", "_text5", "_text6", "_colour"
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
_unit = ((uinamespace getVariable "TOUR_SI_arrayUnit") select 1);
_id = groupID ((uinamespace getVariable "TOUR_SI_arrayUnit") select 0);
_colour = (_unit getVariable "TOUR_SI_smokeColour");

TOUR_SI_pressed_once = nil;
TOUR_SI_pressed_once_end = nil;
_buttonEnd ctrlSetText "END MISSION";

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

{_x ctrlEnable false}forEach [_buttonExecute, _buttonEnd, _buttonInfo, _buttonConfirm, _buttonReject, _comboSupport, _comboType, _comboUnit, _comboBehaviour, _sliderIntSpeed, _sliderAmountHeight, _sliderRadius, _sliderIntSpeed];

_textHelp ctrlSetStructuredText parseText format [
"
	<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconhelicopter_ca.paa'/> <t size='1.25' font='puristaMedium'>HELICOPTER SUPPORT</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Confirming %2 smoke with %1...</t>
", _id, _colour];

TOUR_SI_core setVariable ["TOUR_SI_inUse", true, true];
[player, _id, _colour, _unit] spawn
{
	sleep 2;

	[
		(_this select 0),
		format ["%1, we confirm %2 smoke! OVER", _this select 1, _this select 2],
		"side"
	] call TOUR_SI_fnc_broadcastMessage;

	sleep 5;

	(_this select 3) setVariable ["TOUR_SI_smokeConfirmed", true, true];
	TOUR_SI_core setVariable ["TOUR_SI_inUse", nil, true];
};