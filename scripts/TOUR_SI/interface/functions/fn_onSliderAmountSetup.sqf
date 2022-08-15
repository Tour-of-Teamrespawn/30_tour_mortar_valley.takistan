private 
[
	"_index", "_display", "_map", "_textHelp", "_buttonExecute", "_comboRoundsType", "_comboSliderAmount", "_comboSliderRadius", "_comboSliderInterval", "_text1", "_text2", "_text3", "_text4", "_end"
];

_index = _this select 1;
_display = findDisplay 121320;
_buttonExecute = _display displayCtrl 121322;
_textHelp = _display displayCtrl 121321;
_comboRoundsType = _display displayCtrl 121323;
_comboSliderAmount = _display displayCtrl 121324;

_text1 = (_comboRoundsType lbText (lbCurSel _comboRoundsType));
if(_text1 == "nothing") exitWith 
{
	["error", "No shells of that type found!"] call TOUR_SI_fnc_hint;
};

_text2 = (round sliderPosition _comboSliderAmount);

//Help Text
_textHelp ctrlSetStructuredText parseText format [
"
	<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa'/> <t size='1.25' font='puristaMedium'>ARTILLERY SUPPORT</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>SHELL TYPE: %1</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>ROUNDS: %2</t>
", _text1, _text2];