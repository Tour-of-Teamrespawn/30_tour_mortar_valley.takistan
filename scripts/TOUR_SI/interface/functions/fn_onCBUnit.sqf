private 
[
	"_display", "_map", 
	"_textHelp", "_textSupportType", "_textUnit", "_textType", "_textAmountHeight", "_textRadius", "_textIntSpeed", "_textBehaviour",
	"_buttonExecute", "_buttonEnd", "_buttonInfo", "_buttonConfirm", "_buttonReject",
	"_comboSupport", "_comboType", "_comboUnit", "_comboBehaviour",
	"_sliderAmountHeight", "_SliderRadius", "_SliderIntSpeed",
	"_supportType", "_unit", "_textInfo", "_unitStatus", "_unitPos"
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
_unit = (_comboUnit lbText _index);
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

switch (toLower _supportType) do
{
	case "helicopter":
	{

		{
			if ((str (_x select 0) call TOUR_SI_fnc_groupNameFix) == _unit) exitWith 
			{
				uinamespace setVariable ["TOUR_SI_arrayUnit", _x];
			};
		}forEach (TOUR_SI_Core getVariable "TOUR_SI_Helicopters");

		lbClear _comboType;

		{
			_comboType lbAdd _x;
		}forEach ((uinamespace getVariable "TOUR_SI_arrayUnit") select 2);

		lbClear _comboBehaviour;

		{
			_comboBehaviour lbAdd _x;
		}forEach ["Hold Fire", "Return fire", "Fire at Will"];

		_unitStatus = switch (toLower (((uinamespace getVariable "TOUR_SI_arrayUnit") select 1) getVariable "TOUR_SI_unitStatus")) do
		{
			case "cas": {"Provide close air support"};
			case "cas (laser designation)": {"Provide laser designated close air support"};
			case "circle": {"Provide overwatch"};
			case "land": {"Land at location"};
			case "land (engine off)": {"Land at location"};
			case "move to": {"Move to position"};
			case "pickup": {"Pickup units"};
			case "return to base": {"Return to base"};
			case "idle": {"Idle"};
			case "servicing": {"Servicing"};
			default {"Error!"};
		};

		_unitVar = ((uinamespace getVariable "TOUR_SI_arrayUnit") select 1);
		_unitPos = [getPosATL _unitVar select 0, getposATL _unitVar select 1] call TOUR_SI_fnc_GridFix;

		//text help
		_textInfo =
		format ["
			<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconhelicopter_ca.paa'/> <t size='1.25' font='puristaMedium'>HELICOPTER SUPPORT</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>UNIT: %1</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>ORDERS: %2.</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>LOCATION: %3.</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Use the options below and select a point on the map to customize your helicopter support request, and press EXECUTE COMMAND.</t>
		", _unit, _unitStatus, _unitPos];

		_sliderAmountHeight sliderSetPosition 0;
		_sliderRadius sliderSetPosition 0;
		_sliderIntSpeed sliderSetPosition 0;

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
		}forEach 	[_comboUnit, _comboType];

		{
			_x ctrlEnable false;
		}forEach 	[_buttonExecute, _buttonConfirm, _buttonReject,
					_comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed];	

		if (!isNil {(((uinamespace getVariable "TOUR_SI_arrayUnit") select 1) getVariable "TOUR_SI_smokeColour")}) then
		{
			_colour = (((uinamespace getVariable "TOUR_SI_arrayUnit") select 1) getVariable "TOUR_SI_smokeColour");
			{
				_x ctrlShow true;
				_x ctrlEnable true;
			}forEach 	[_buttonConfirm, _buttonReject];
			_buttonConfirm ctrlSetEventHandler ["ButtonDown", "_this call TOUR_SI_fnc_onButtonConfirm"];
		};
	};
	
	case "plane":
	{

		{
			if ((str (_x select 0) call TOUR_SI_fnc_groupNameFix) == _unit) exitWith 
			{
				uinamespace setVariable ["TOUR_SI_arrayUnit", _x];
			};
		}forEach (TOUR_SI_Core getVariable "TOUR_SI_Planes");

		lbClear _comboType;

		{
			_comboType lbAdd _x;
		}forEach ((uinamespace getVariable "TOUR_SI_arrayUnit") select 2);

		lbClear _comboBehaviour;

		{
			_comboBehaviour lbAdd _x;
		}forEach ["Hold Fire", "Return fire", "Fire at Will"];

		_unitStatus = switch (toLower (((uinamespace getVariable "TOUR_SI_arrayUnit") select 1) getVariable "TOUR_SI_unitStatus")) do
		{
			case "cas": {"Provide close air support"};
			case "cas (laser designation)": {"Provide laser designated close air support"};
			case "circle": {"Provide overwatch"};
			case "land": {"Land at location"};
			case "land (engine off)": {"Land at location"};
			case "move to": {"Move to position"};
			case "pickup": {"Pickup units"};
			case "return to base": {"Return to base"};
			case "idle": {"Idle"};
			case "servicing": {"Servicing"};
			default {"Error!"};
		};

		_unitVar = ((uinamespace getVariable "TOUR_SI_arrayUnit") select 1);
		_unitPos = [getPosATL _unitVar select 0, getposATL _unitVar select 1] call TOUR_SI_fnc_GridFix;

		//text help
		_textInfo =
		format ["
			<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconplane_ca.paa'/> <t size='1.25' font='puristaMedium'>PLANE SUPPORT</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>UNIT: %1</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>ORDERS: %2.</t>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>LOCATION: %3.</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Use the options below and select a point on the map to customize your plane support request, and press EXECUTE COMMAND.</t>
		", _unit, _unitStatus, _unitPos];

		_sliderAmountHeight sliderSetPosition 0;
		_sliderRadius sliderSetPosition 0;
		_sliderIntSpeed sliderSetPosition 0;

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
		}forEach 	[_comboUnit, _comboType];

		{
			_x ctrlEnable false;
		}forEach 	[_buttonExecute, _buttonConfirm, _buttonReject,
					_comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed];	

		if (!isNil {(((uinamespace getVariable "TOUR_SI_arrayUnit") select 1) getVariable "TOUR_SI_smokeColour")}) then
		{
			_colour = (((uinamespace getVariable "TOUR_SI_arrayUnit") select 1) getVariable "TOUR_SI_smokeColour");
			{
				_x ctrlShow true;
				_x ctrlEnable true;
			}forEach 	[_buttonConfirm, _buttonReject];
			_buttonConfirm ctrlSetEventHandler ["ButtonDown", "_this call TOUR_SI_fnc_onButtonConfirm"];
		};
	};	
};

//Help Text
_textHelp ctrlSetStructuredText parseText _textInfo;

_map ctrlSetEventHandler ["MouseButtonClick", ""];

_mkrnumber = 1;
while {!(str (getMarkerPos (format ["TOUR_SI_marker_%1", _mkrnumber])) == "[0,0,0]")} do
{
	deleteMarkerLocal format ["TOUR_SI_marker_%1", _mkrnumber];
	_mkrnumber = _mkrnumber + 1;
};