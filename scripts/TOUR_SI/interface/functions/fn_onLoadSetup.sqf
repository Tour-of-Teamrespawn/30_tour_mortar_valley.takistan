private 
[
	"_display", "_textHelp", "_buttonExecute", "_comboRoundsType", "_comboSliderAmount"
];

_display = _this select 0;
_buttonExecute = _display displayCtrl 121322;
_textHelp = _display displayCtrl 121321;
_comboRoundsType = _display displayCtrl 121323;
_comboSliderAmount = _display displayCtrl 121324;

disableSerialization;

if (!isNil {TOUR_SI_core getVariable "TOUR_SI_inuse"}) exitWith
{
	_textHelp ctrlSetStructuredText parseText
	"
		<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>COMMUNICATIONS BUSY</t>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Support Services In Use! Please Try Again Later.</t>
	";
	{_x ctrlEnable false}forEach [_comboSliderAmount, _comboRoundsType];
};

TOUR_SI_core setVariable ["TOUR_SI_inuse", false, true];

_types = [];
{
	
	_t = switch (toLower (_x select 0)) do
	{
		case "32rnd_155mm_mo_shells": {"155mm HE Rounds"};
		case "8rnd_82mm_mo_shells": {"82mm HE Rounds"};
		case "8rnd_82mm_mo_flare_white": {"82mm Flare Rounds"};
		case "8rnd_82mm_mo_smoke_white": {"82mm Smoke Rounds"};
		case "8rnd_82mm_mo_guided": {"82mm Guided Rounds"};
		case "8rnd_82mm_mo_lg": {"82mm Laser Guided Rounds"};
		case "6rnd_155mm_mo_smoke": {"155mm Smoke Rounds"};
		case "2rnd_155mm_mo_guided":	{"155mm Guided Rounds"};
		case "2rnd_155mm_mo_lg": {"155mm Laser Guided Rounds"};
		case "6rnd_155mm_mo_mine": {"155mm Mine Rounds"};
		case "6rnd_155mm_mo_at_mine": {"155mm AT Mine Rounds"};
		case "2rnd_155mm_mo_cluster": {"155mm Cluster Rounds"};
		default {""};
	};
	_types set [count _types, _t];

}forEach (TOUR_SI_core getVariable "TOUR_SI_ammo");

//Combo Box's
lbClear _comboRoundsType; { _comboRoundsType lbAdd _x;} forEach _types;

//Sliders
_comboSliderAmount sliderSetRange [0, 100]; _comboSliderAmount sliderSetspeed [1, 1]; _comboSliderAmount sliderSetPosition 0;

{_x ctrlEnable false}forEach [_comboSliderAmount];

//Event Handlers
_buttonExecute ctrlSetEventHandler ["ButtonDown", "_this call TOUR_SI_fnc_onButtonExecuteSetup"];
_comboRoundsType ctrlSetEventHandler ["LBSelChanged", "_this call TOUR_SI_fnc_onCbTypeSetup"];
_comboSliderAmount ctrlSetEventHandler ["SliderPosChanged", "_this call TOUR_SI_fnc_onSliderAmountSetup"];

_buttonInfo ctrlEnable true;

//Help Text
_textHelp ctrlSetStructuredText parseText
"
	<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>ADJUST PARAMETERS</t>
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>From the drop down menu below, select the type of rounds to edit and then use the slider to adjust the amount of rounds available.</t>
";
