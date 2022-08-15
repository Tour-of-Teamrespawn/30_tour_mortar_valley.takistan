private 
[
	"_display", "_textHelp", "_buttonExecute", "_comboRoundsType", "_comboSliderAmount", "_text1", "_ammoclass"
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

_ammotext = switch (toLower _text1) do
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

_comboSliderAmount sliderSetRange [0, 100];
_comboSliderAmount sliderSetPosition _ammo;

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


//Comboboxes
{_x ctrlEnable true}forEach [_comboSliderAmount, _buttonExecute];
