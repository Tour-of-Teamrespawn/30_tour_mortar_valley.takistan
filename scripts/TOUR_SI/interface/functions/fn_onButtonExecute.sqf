private 
[
	"_display", "_map", 
	"_textHelp", "_textSupportType", "_textUnit", "_textType", "_textAmountHeight", "_textRadius", "_textIntSpeed", "_textBehaviour",
	"_buttonExecute", "_buttonEnd", "_buttonInfo", "_buttonConfirm", "_buttonReject",
	"_comboSupport", "_comboType", "_comboUnit", "_comboBehaviour",
	"_sliderAmountHeight", "_SliderRadius", "_SliderIntSpeed",
	"_position", "_abort", "_end", "_buttonInfo", "_text1", "_text2", "_text3", "_text4", "_text5", "_text6", "_markers", "_mkrNumber"
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

_position = getMarkerPos "TOUR_SI_marker_1";

_text1 = (_comboType lbText (lbCurSel _comboType));

_text2 = (round sliderPosition _sliderAmountHeight);

_text3 = (round sliderPosition _sliderRadius);

_text4 = (round sliderPosition _sliderIntSpeed);

_text = 
"
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>TRANSMITTING ORDERS</t>
";

if (str (getMarkerPos "TOUR_SI_marker_1") == "[0,0,0]") then
{

	if (_supportType == "Artillery") then
	{
		_text = 
		"
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>TARGET REQUIRED: Please select a target location by clicking on the map</t>
			<br/>
		";
		_abort = true;
	};
	if (_supportType == "Helicopter") then
	{
		if (_commandType != "Return To Base") then
		{
			_text = 
			"
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>LOCATION REQUIRED: Please select a location by clicking on the map</t>
				<br/>
			";
			_abort = true;			
		};
	};
	if (_supportType == "Plane") then
	{
		if (_commandType != "Return To Base") then
		{
			_text = 
			"
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>LOCATION REQUIRED: Please select a location by clicking on the map</t>
				<br/>
			";
			_abort = true;			
		};
	};
};

if (_text1 == "") then
{
	_abort = true;
	if (_supportType == "Artillery") then
	{
		_text = 
		"
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>ROUNDS NOT SELECTED: Please select the required type of rounds for your strike</t>
			<br/>
		";
	};
	if (_supportType == "Helicopter") then
	{
		_text = 
		"
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>FLIGHT ORDERS NOT SELECTED: Please select the command you want the unit to carry out</t>
			<br/>
		";
	};
	if (_supportType == "Plane") then
	{
		_text = 
		"
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>FLIGHT ORDERS NOT SELECTED: Please select the command you want the unit to carry out</t>
			<br/>
		";
	};
};

if (_text2 < 1) then
{
	_abort = true;
	if (_supportType == "Artillery") then
	{
		_text = 
		"
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>AMOUNT NOT SELECTED: Please select the required amount of rounds for your strike</t>
			<br/>
		";
	};
	if (_supportType == "Helicopter") then
	{
		_text = 
		"
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>FLIGHT HEIGHT NO SELECTED: Please select the height in which you want the helicopter to fly at</t>
			<br/>
		";
	};
	if (_supportType == "Plane") then
	{
		_text = 
		"
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>FLIGHT HEIGHT NO SELECTED: Please select the height in which you want the helicopter to fly at</t>
			<br/>
		";
	};
};

if (_text3 < 0) then
{
	if (_supportType == "Artillery") then
	{
		_abort = true;
		_text = 
		"
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>DISPERSION NOT SET: Please select the dispersion radius for your strike</t>
			<br/>
		";
	};
	if (_supportType == "Helicopter") then
	{
		if (toLower _commandType in ["cas", "cas (laser designation)", "pickup"]) then
		{
			_abort = true;
			_text = 
			"
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>PATROL RADIUS NOT SET: Please select the patrol radius you want the helicopter to fly around when it reaches its location</t>
				<br/>
			";
		};
	};
	if (_supportType == "Plane") then
	{
		if (toLower _commandType in ["cas", "cas (laser designation)", "pickup"]) then
		{
			_abort = true;
			_text = 
			"
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>PATROL RADIUS NOT SET: Please select the patrol radius you want the helicopter to fly around when it reaches its location</t>
				<br/>
			";
		};
	};
};

if (_text4 < 2) then
{
	if (_supportType == "Artillery") then
	{
		_abort = true;
		_text = 
		"
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>INTERVAL NOT SET: Please select the interval between rounds your strike</t>
			<br/>
		";
	};
	if (_supportType == "Helicopter") then
	{
		if (_text4 < 0) then
		{
			_abort = true;
			_text = 
			"
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>SPEED NOT SET: Please select the speed you wish the helicopter to fly at</t>
				<br/>
			";
		};
	};
	if (_supportType == "Plane") then
	{
		if (_text4 < 0) then
		{
			_abort = true;
			_text = 
			"
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>SPEED NOT SET: Please select the speed you wish the helicopter to fly at</t>
				<br/>
			";
		};
	};
};

if ((_supportType == "Helicopter")or(_supportType == "Plane")) then
{
	_text5 = (_comboBehaviour lbText (lbCurSel _comboBehaviour));
	if (_text5 == "") then
	{
		if !(toLower _commandType in ["cas", "cas (laser designation)"]) then
		{
			_abort = true;
			_text = 
			"
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>BEHAVIOUR NOT SET: Please select the behaviour of the crew</t>
				<br/>
			";
		};
	};
};

if (!isNil "_abort") exitWith 
{
	//Help Text
	_textHelp ctrlSetStructuredText parseText format [
	"
		<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>INVALID PARAMETERS</t>
		<br/>
		<br/>
		%1
	", _text];
};

switch (toLower _supportType) do
{
	case "artillery": {
				_textHelp ctrlSetStructuredText parseText format [
				"
				<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa'/> <t size='1.25' font='puristaMedium'>ARTILLERY SUPPORT</t>
				<br/>
				<br/>
				%1
				", _text];
			};
	case "helicopter": {
				_textHelp ctrlSetStructuredText parseText format [
				"
				<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconhelicopter_ca.paa'/> <t size='1.25' font='puristaMedium'>HELICOPTER SUPPORT</t>
				<br/>
				<br/>
				%1
				", _text];
			};
	case "plane": {
				_textHelp ctrlSetStructuredText parseText format [
				"
				<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconplane_ca.paa'/> <t size='1.25' font='puristaMedium'>PLANE SUPPORT</t>
				<br/>
				<br/>
				%1
				", _text];
			};
};
TOUR_SI_core setVariable ["TOUR_SI_inUse", true, true];

if (_text2 == 1) then
{
	_text4 = 0;
};

{_x ctrlEnable false}forEach [_buttonExecute, _buttonEnd, _buttonInfo, _buttonConfirm, _buttonReject, _comboSupport, _comboType, _comboUnit, _comboBehaviour, _sliderIntSpeed, _sliderAmountHeight, _sliderRadius, _sliderIntSpeed];

if (_supportType == "Artillery") exitWith
{
	[_position, _text1, _text2, _text3, _text4, player] remoteExec ["TOUR_SI_fnc_radio_EFM", 0, false];
};

_markers = [];
_mkrnumber = 1;
while {!(str (getMarkerPos format ["TOUR_SI_marker_%1", _mkrnumber]) == "[0,0,0]")} do
{
	_markers set [count _markers, (getMarkerpos format ["TOUR_SI_marker_%1", _mkrnumber])];
	_mkrnumber = _mkrnumber + 1;
};

if (_supportType == "Helicopter") then
{
	_text4 = switch (_text4) do
	{
		case 0: {"LIMTIED"};
		case 1: {"NORMAL"};
		case 2: {"FULL"};
	};

	[_markers, _text1, _text2, _text3, _text4,_text5, (uinamespace getVariable "TOUR_SI_arrayUnit"), player] remoteExec ["TOUR_SI_fnc_radio_EHM", 0, false];
};

if (_supportType == "Plane") then
{
	_text4 = switch (_text4) do
	{
		case 0: {"LIMTIED"};
		case 1: {"NORMAL"};
		case 2: {"FULL"};
	};
	[_markers, _text1, _text2, _text3, _text4,_text5, (uinamespace getVariable "TOUR_SI_arrayUnit"), player] remoteExec ["TOUR_SI_fnc_radio_EHM", 0, false];
//	[[_markers, _text1, _text2, _text3, _text4,_text5, (uinamespace getVariable "TOUR_SI_arrayUnit"), player], "TOUR_SI_fnc_radio_EHM"]call BIS_fnc_MP;
};