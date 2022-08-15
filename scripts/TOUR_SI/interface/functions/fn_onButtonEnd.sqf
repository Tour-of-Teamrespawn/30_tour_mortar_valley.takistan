private 
[
	"_display", "_map", 
	"_textHelp", "_textSupportType", "_textUnit", "_textType", "_textAmountHeight", "_textRadius", "_textIntSpeed", "_textBehaviour",
	"_buttonExecute", "_buttonEnd", "_buttonInfo", "_buttonConfirm", "_buttonReject",
	"_comboSupport", "_comboType", "_comboUnit", "_comboBehaviour",
	"_sliderAmountHeight", "_SliderRadius", "_SliderIntSpeed",
	"_end"
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

TOUR_SI_pressed_once = nil;

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

if (!isNil {TOUR_SI_core getVariable "A2S_taskArray"}) then
{
	if (count (TOUR_SI_core getVariable "A2S_taskArray") > 0) then
	{
		if (str (getMarkerPos "TDMC_mkr_AO_1") != "[0,0,0]") then
		{
			if (
					(({(alive _x) && ((vehicle _x) inArea "TDMC_mkr_AO_1")}count (playableUnits + switchableUnits)) == 0)
					OR
					(({(alive _x) && (((vehicle _x) distance (getMarkerPos "TOUR_Base")) > 1000)}count (playableUnits + switchableUnits)) == 0)
				) then
			{
				if (isNil "TOUR_SI_pressed_once_end") then
				{
					_textHelp ctrlSetStructuredText parseText
					"
						<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>REPORT IN</t>
						<br/>
						<br/>
						<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Press the button again, to confirm you are ready to radio in to HQ and end the mission.</t> 
					";
					TOUR_SI_pressed_once_end = true;
					_buttonEnd ctrlSetText "PRESS TO CONFIRM MISSION END";
				}else
				{
					_textHelp ctrlSetStructuredText parseText
					"
						<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>REPORT IN</t>
						<br/>
						<br/>
						<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Reporting to HQ via Radio...</t> 
					";	
					TOUR_SI_core setVariable ["TOUR_SI_inUse", true, true];
					player remoteExecCall ["TOUR_SI_fnc_radio_end", 2, false];
					_buttonEnd ctrlSetText "MISSION ENDING";
					{_x ctrlEnable false}forEach [_buttonExecute, _buttonEnd, _buttonInfo, _buttonConfirm, _buttonReject, _comboSupport, _comboType, _comboUnit, _comboBehaviour, _sliderIntSpeed, _sliderAmountHeight, _sliderRadius, _sliderIntSpeed];

				};	
			} else
			{
				_textHelp ctrlSetStructuredText parseText
				"
				<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>REPORT IN:</t>
				<br/>
				<br/>
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>You cannot report in and end the mission. There are still friendly units within the AO!</t>
				";	
			};
		}else
		{
			if (TOUR_SI_extraEnabled == 1) then
				{
					if (!isNil "TOUR_SI_extraCheck") then
					{
						if (call TOUR_SI_extraCheck) then
						{
							if (isNil "TOUR_SI_pressed_once_end") then
							{
								_textHelp ctrlSetStructuredText parseText
								"
									<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>REPORT IN</t>
									<br/>
									<br/>
									<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Press the button again, to confirm you are ready to radio in to HQ and end the mission.</t> 
								";
								TOUR_SI_pressed_once_end = true;
								_buttonEnd ctrlSetText "PRESS TO CONFIRM MISSION END";
							}else
							{
								_textHelp ctrlSetStructuredText parseText
								"
									<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>REPORT IN</t>
									<br/>
									<br/>
									<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Reporting to HQ via Radio...</t> 
								";	
								TOUR_SI_core setVariable ["TOUR_SI_inUse", true, true];
								player remoteExecCall ["TOUR_SI_fnc_radio_end", 2, false];
								_buttonEnd ctrlSetText "MISSION ENDING";
								{_x ctrlEnable false}forEach [_buttonExecute, _buttonEnd, _buttonInfo, _buttonConfirm, _buttonReject, _comboSupport, _comboType, _comboUnit, _comboBehaviour, _sliderIntSpeed, _sliderAmountHeight, _sliderRadius, _sliderIntSpeed];
							};						
						}else
						{
								_textHelp ctrlSetStructuredText parseText
								"
									<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>REPORT IN</t>
									<br/>
									<br/>
									<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>You are currently unable to report in.</t> 
								";						
						};
					};
				}else
				{
					_textHelp ctrlSetStructuredText parseText
					"
						<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>REPORT IN:</t>
						<br/>
						<br/>
						<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>You cannot report in and end the mission. There is no active operations area!</t> 
					";
				};
		};
	}else
	{
		_textHelp ctrlSetStructuredText parseText
		"
			<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>REPORT IN:</t>
			<br/>
			<br/>
			<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>You cannot report in and end the mission. There is no mission currently active!</t> 
		";	
	};
}else
{
				_textHelp ctrlSetStructuredText parseText
			"
				<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\call_ca.paa'/> <t size='1.25' font='puristaMedium'>REPORT IN:</t>
				<br/>
				<br/>
				<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>You cannot report in and end the mission. There is no missions ever been created!</t> 
			";	
};

