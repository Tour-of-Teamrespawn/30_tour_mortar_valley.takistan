private 
[
	"_display", "_map", 
	"_textHelp", "_textSupportType", "_textUnit", "_textType", "_textAmountHeight", "_textRadius", "_textIntSpeed", "_textBehaviour",
	"_buttonExecute", "_buttonEnd", "_buttonInfo", "_buttonConfirm", "_buttonReject",
	"_comboSupport", "_comboType", "_comboUnit", "_comboBehaviour",
	"_sliderAmountHeight", "_SliderRadius", "_SliderIntSpeed",
	"_supportType", "_textInfo"
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
_supportType = (_comboSupport lbText _index);

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

_map ctrlSetEventHandler ["MouseButtonClick", ""];

switch (toLower _supportType) do
{
	case "artillery":
	{
		uinamespace setVariable ["TOUR_SI_arrayUnit", nil];
		
		//Combo Box's
		lbClear _comboType;

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
			if (_t != "") then
			{
				if (_x select 1 > 0) then
				{
					_comboType lbAdd _t;
				};
			};
		}forEach (TOUR_SI_core getVariable "TOUR_SI_ammo");	
					
		_comboType lbSetCurSel -1;			
					
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
		}forEach 	[_comboType];
		
		{
			_x ctrlEnable false;
		}forEach 	[_buttonExecute, _buttonConfirm, _buttonReject,
					_comboUnit, _comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed];
		
		_textType ctrlSetText "TYPE OF SHELLS:";
		_textAmountHeight ctrlSetText "AMOUNT OF SHELLS:";
		_textRadius ctrlSetText "DISPERSION RADIUS:";
		_textIntSpeed ctrlSetText "INTERVAL BETWEEN ROUNDS:";
		_buttonExecute ctrlSetText "EXECUTE FIRE MISSION";
		
		_sliderAmountHeight sliderSetPosition 0;
		_sliderRadius sliderSetPosition 0;
		_sliderIntSpeed sliderSetPosition 0;
		
		//Help Text
		_textInfo =
		"
			<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa'/> <t size='1.25' font='puristaMedium'>SELECT SUPPORT REQUEST</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>ARTILLERY: Use the options below and select a point on the map to customize your artillery strike, and press REQUEST FIRE MISSION.</t>
		";
	};
	case "helicopter":
	{
		//Combo Box's
		lbClear _comboUnit;
		lbClear _comboType;
		lbClear _comboBehaviour;
		{
			if (!isNull (_x select 1)) then
			{
				if (!isNull (driver (_x select 1))) then
				{
					if !(grpNull == (_x select 0)) then
					{
						if (group (driver (_x select 1)) == (_x select 0)) then
						{
							if (canMove (_x select 1)) then
							{
								_grpName = (groupId (_x select 0));
								_comboUnit lbAdd _grpName;
							};
						};
					};
				};
			};
		}forEach (TOUR_SI_core getVariable "TOUR_SI_Helicopters");	
		
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
		}forEach 	[_comboUnit];
		
		{
			_x ctrlEnable false;
		}forEach 	[_buttonExecute, _buttonConfirm, _buttonReject, 
					_comboType, _comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed];		
		
		_textType ctrlSetText "HELICOPTER ORDERS:";
		_textAmountHeight ctrlSetText "FLIGHT HEIGHT:";
		_textRadius ctrlSetText "PATROL RADIUS:";
		_textIntSpeed ctrlSetText "FLIGHT SPEED:";
		_buttonExecute ctrlSetText "EXECUTE COMMAND";

		_sliderAmountHeight sliderSetPosition 0;
		_sliderRadius sliderSetPosition 0;
		_sliderIntSpeed sliderSetPosition 0;
		
		//text help
		_textInfo =
		"
			<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconhelicopter_ca.paa'/> <t size='1.25' font='puristaMedium'>HELICOPTER SUPPORT</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Use the options below and select a point on the map to customize your helicopter support request, and press EXECUTE COMMAND.</t>
		";
	};
	
	case "plane":
	{
		//Combo Box's
		lbClear _comboUnit;
		lbClear _comboType;
		lbClear _comboBehaviour;
		{
			if (!isNull (_x select 1)) then
			{
				if (!isNull (driver (_x select 1))) then
				{
					if !(grpNull == (_x select 0)) then
					{
						if (group (driver (_x select 1)) == (_x select 0)) then
						{
							if (((canMove (_x select 1)) or (!isNil {(_x select 1) getVariable "TOUR_SI_unitFuel"})) && (damage (_x select 1) < 0.7)) then
							{
								_grpName = (groupId (_x select 0));
								_comboUnit lbAdd _grpName;
							};
						};
					};
				};
			};
		}forEach (TOUR_SI_core getVariable "TOUR_SI_Planes");	
		
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
		}forEach 	[_comboUnit];
		
		{
			_x ctrlEnable false;
		}forEach 	[_buttonExecute, _buttonConfirm, _buttonReject,
					_comboType, _comboBehaviour,
					_sliderAmountHeight, _sliderRadius, _sliderIntSpeed];		
		
		_textType ctrlSetText "PLANE ORDERS:";
		_textAmountHeight ctrlSetText "PLANE HEIGHT:";
		_textRadius ctrlSetText "PATROL RADIUS:";
		_textIntSpeed ctrlSetText "PLANE SPEED:";
		_buttonExecute ctrlSetText "EXECUTE COMMAND";

		_sliderAmountHeight sliderSetPosition 0;
		_sliderRadius sliderSetPosition 0;
		_sliderIntSpeed sliderSetPosition 0;
		
		//text help
		_textInfo =
		"
			<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconplane_ca.paa'/> <t size='1.25' font='puristaMedium'>PLANE SUPPORT</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Use the options below and select a point on the map to customize your plane support request, and press EXECUTE COMMAND.</t>
		";
	};
	default {"hint there is no support type!!!";};
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
