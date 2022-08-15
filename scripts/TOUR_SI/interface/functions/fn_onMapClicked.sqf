private 
[
	"_display", "_map", "_textHelp", "_buttonExecute", "_comboRoundsType", "_comboSliderAmount", "_comboSliderRadius", "_comboSliderInterval", "_marker", "_x", "_y", "_pos", "_mkrnumber"
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

_map = _this select 0;
_key = _this select 1;
_x = _this select 2;
_y = _this select 3;
_pos = _map ctrlMapScreenToWorld [_x, _y];

if ((toLower _supportType) in ["helicopter"]) then
{
	if (_key == 0) then
	{
		_mkrnumber = 1;
		while {true} do
		{
			if (str (getMarkerPos format ["TOUR_SI_marker_%1", _mkrnumber]) == "[0,0,0]") exitWith 
			{
				_mkr = createMarkerLocal [format ["TOUR_SI_marker_%1", _mkrnumber], _pos];
				_mkr setMarkerTypeLocal "hd_Start";
				if ((_mkrnumber - 1) == 1) then
				{
					(format ["TOUR_SI_marker_%1", (_mkrnumber - 1)]) setMarkerTypeLocal "hd_Start";
				};
				if ((_mkrnumber - 1) > 1) then
				{
					(format ["TOUR_SI_marker_%1", (_mkrnumber - 1)]) setMarkerTypeLocal "Waypoint";
				};
				_mkrtype = switch (toLower _commandType) do
				{
					case "cas": {"hd_destroy"};
					case "cas (laser designation)": {"hd_destroy"};
					case "circle": {"hd_End"};
					case "land": {"hd_join"};
					case "land (engine off)": {"hd_join"};
					case "move to": {"hd_End"};
					case "pickup": {"hd_pickup"};
					case "return to base": {"hd_End"};
					case "idle": {"hd_unknown"};
					case "servicing": {"hd_unknown"};			
					default {"hd_unknown"};
				};
				_mkr setMarkerTypeLocal _mkrtype;
				_mkr setMarkerColorLocal "ColorRed";
			};
			_mkrnumber = _mkrnumber +1;		
		};
	};
	
}else
{
		if (str (getMarkerPos "TOUR_SI_marker_1") == "[0,0,0]") then
		{
			_marker = createMarkerLocal ["TOUR_SI_marker_1", _pos];
		}else
		{
			_marker = "TOUR_SI_marker_1";
			_marker setMarkerPosLocal _pos;
		};
		_marker setMarkerTypeLocal "hd_destroy";
		_marker setMarkerColorLocal "ColorRed";
	if ((toLower _commandType) == "move") then
	{
		_marker setMarkerTypeLocal "hd_waypoint";
		_marker setMarkerColorLocal "ColorRed";
	};
};


	//Help Text

if (_supportType == "Artillery") then
{	
	_textHelp ctrlSetStructuredText parseText
	"
		<img size='3' image='\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\artillery_ca.paa'/> <t size='1.25' font='puristaMedium'>Artillery Support</t>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Use the options below and select a point on the map to customize your artillery strike, and press EXECUTE FIRE MISSION.</t>
	";
};

if (_supportType == "Helicopter") then
{
	_textHelp ctrlSetStructuredText parseText
	"
		<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconhelicopter_ca.paa'/> <t size='1.25' font='puristaMedium'>HELICOPTER SUPPORT</t>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>WAYPOINT SET</t>
		<br/>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Use the options below and select one objective point on the map to customize your helicopter support request, and press EXECUTE COMMAND. You can also add a route to the objective by click multiple points.</t>
	";
};

if (_supportType == "Plane") then
{
	_textHelp ctrlSetStructuredText parseText
	"
		<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconplane_ca.paa'/> <t size='1.25' font='puristaMedium'>PLANE SUPPORT</t>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>WAYPOINT SET</t>
		<br/>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Use the options below and select a point on the map to customize your plane support request, and press EXECUTE COMMAND.</t>
	";
};

if (_commandType == "Move To (Route)") then
{
	_textHelp ctrlSetStructuredText parseText
	"
		<img size='3' image='\a3\ui_f\data\map\vehicleicons\iconplane_ca.paa'/> <t size='1.25' font='puristaMedium'>PLANE SUPPORT</t>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>PLOTTING ROUTE</t>
		<br/>
		<br/>
		<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>Continue to click on the map to plot the route to the final destination, and press EXECUTE COMMAND.</t>
	";
};

//Map Animation
_map ctrlMapAnimAdd [0.1, ctrlMapScale _map, _pos];
ctrlMapAnimCommit _map;