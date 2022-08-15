
/***************************
//BACKGROUND
***************************/
class TOUR_RC_RscBackground
{
	idc = -1; 
	type = 0;
	style = 0x00;
	colorBackground[] = { };
	colorText[] = { };
	font = "puristaMedium";
	text = "";
	sizeEx = 0.023;
	moving = 0;
	x = "(safeZoneX + (safeZoneW / 1.8))"; 
	y = "(safeZoneY + (safeZoneH / 3.25))"; 
	w = "(safeZoneW / 3)";
	h = "(safeZoneH / 2)";
};

/***************************
Edit
***************************/
class TOUR_RC_RscEdit 
{
	idc = -1;
	type = 2;
	style = 0x00;
	x = "1";
	y = "1";
	w = "safeZoneW / 25";
	h = "safeZoneH / 30";
	
	sizeEx = 0.03;
	font = "puristaMedium";
	text = "";
	
	colorText[] = {1,1,1,1};
	autocomplete = 0;
	colorSelection[] = {0,0,0,1};
};

/***************************
Text
***************************/
class TOUR_RC_RscText
{ 
	idc = -1; 
	type = 13; 
	style = 0x00;
	colorBackground[] = { 0, 0, 0, 0 };
	size = "((safeZoneW / 75) + (safeZoneH / 225))";
	x = "safeZoneX + (safeZoneW / 6)"; 
	y = "safeZoneY + (safeZoneH / 6)"; 
	w = "safeZoneW / 5"; 
	h = "safeZoneH / 10";
	text = "";
	class Attributes 
	{ 
		font = "puristaMedium"; 
		color = "#C0C0C0"; 
		align = "center"; 
		valign = "middle"; 
		shadow = true; 
		shadowColor = "#000000";
		size = "1"; 
	};
};

/***************************
//Slider
***************************/
class TOUR_RC_RscSlider
{ 
	idc = -1;
	type = 43;
	style = 0x400 + 0x10;
	x = "safeZoneX + (safeZoneW / 5.6)";
	y = "safeZoneY + (safeZoneH / 1.6)";
	w = "safeZoneW / 5.5";
	h = "safeZoneH / 40";
	color[] = {1, 1, 1, 0.4};
	colorActive[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.2};
	arrowEmpty = "\a3\ui_f\data\gui\cfg\slider\arrowempty_ca.paa";
	arrowFull = "\a3\ui_f\data\gui\cfg\slider\arrowfull_ca.paa";
	border = "\a3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\a3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

/***************************
//ListBox
***************************/
class TOUR_RC_RscListBox {
	type = 5;
	style = 0 + 0x10;
	font = "puristaMedium";
	sizeEx = (safeZoneH / 100) + (safeZoneH / 100);
	x = "safeZoneX + (safeZoneW / 5)";
	y = "safeZoneY + (safeZoneH / 2.25)";
	w = "(safeZoneW / 10)";
	h = "(safeZoneH / 17)";
	color[] = {1, 1, 1, 1};
	colorText[] = {0.95, 0.95, 0.95, 1};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorSelect2[] = {0.023529, 0, 0.0313725, 1};
	colorSelectBackground[] = {0.58, 0.1147, 0.1108, 1};
	colorSelectBackground2[] = {0.58, 0.1147, 0.1108, 1};
	period = 1;
	colorBackground[] = {0, 0, 0, 1};
	maxHistoryDelay = 1.0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	soundSelect[] = {"", 0.0, 1};
	soundExpand[] = {"", 0.0, 1};
	soundCollapse[] = {"", 0.0, 1};
};

class TOUR_RC_RscGUIListBox : TOUR_RC_RscListBox 
{
	color[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 0.75};
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};
	colorSelect2[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0.6, 0.839, 0.47, 0.3};
	colorSelectBackground2[] = {0.6, 0.839, 0.47, 1};
	period = 0;
	sizeEx = (safeZoneH / 100) + (safeZoneH / 100);
	class ComboScrollBar
	{
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\addons\ui_f\a3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\addons\ui_f\a3\ui_f\data\gui\cfg\scrollbar\arrowfull_ca.paa";
		arrowEmpty = "\addons\ui_f\a3\ui_f\data\gui\cfg\scrollbar\arrowempty_ca.paa";
		border = "\addons\ui_f\a3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

/***************************
//ComboBox
***************************/
class TOUR_RC_RscComboBox
{
	access = 0;
	type = 4;
	style = 0;
	colorSelect[] = {0.023529,0,0.0313725,1};
	colorText[] = {0.023529,0,0.0313725,1};
	colorBackground[] = {0.95,0.95,0.95,1};
	colorScrollbar[] = {0.023529,0,0.0313725,1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	class ComboScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\addons\ui_f\a3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\addons\ui_f\a3\ui_f\data\gui\cfg\scrollbar\arrowfull_ca.paa";
		arrowEmpty = "\addons\ui_f\a3\ui_f\data\gui\cfg\scrollbar\arrowempty_ca.paa";
		border = "\addons\ui_f\a3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
	x = "safeZoneX + (safeZoneW / 8)";
	y = "safeZoneY + (safeZoneH / 5)";
	w = "(safeZoneW / 10)";
	h = "(safeZoneH / 20)";
	shadow = 0;
	colorSelectBackground[] = {0.8784,0.8471,0.651,1};
	arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
	arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0,0,0,0.6};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	font = "puristaMedium";
	sizeEx = "(safeZoneH / 100) + (safeZoneH / 100)";
};


/***************************
//Button
***************************/
class TOUR_RC_RscButton
{
	idc = -1;
	type = 16;
	style = 0x00;
	default = 0;
	shadow = 2;
	x = "safeZoneX + (safeZoneW / 5)";
	y = "safeZoneY + (safeZoneH / 1.525)";
	w = "(safeZoneW / 12.5)";
	h = "(safeZoneH / 20)";
	color[] = {0.8784, 0.8471, 0.651, 1.0};
	color2[] = {0.95, 0.95, 0.95, 1};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorFocused[] = {0.75,0.75,0.75,1};
	colorBackgroundFocused[] = {0.75,0.75,0.75,1};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	
	class HitZone
	{
		left = "safeZoneW / 100";
		top = "safeZoneH / 100";
		right = "safeZoneW / 100";
		bottom = "safeZoneH / 100";
	};
	
	class ShortcutPos
	{
		left = "safeZoneW / 100";
		top = "safeZoneH / 100";
		w = "safeZoneW / 100";
		h = "safeZoneH / 100";
	};
	
	class TextPos
	{
		left = "safeZoneW / 50";
		right = "safeZoneW / 50";
		top = "safeZoneH / 75";
		bottom = "safeZoneH / 100";
	};
	animTextureNormal = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	animTextureDisabled = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
	animTextureOver = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\over_ca.paa";
	animTextureFocused = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\focus_ca.paa";
	animTexturePressed = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\down_ca.paa";
	animTextureDefault = "\a3\ui_f\data\gui\RscCommon\RscShortcutButton\background_ca.paa";
	period = 0.4;
	font = "puristaMedium";
	size = "(safeZoneW / 125) + (safeZoneH / 125)";
	sizeEx = "(safeZoneW / 125) + (safeZoneH / 125)";
	text = "";
	textureNoShortcut = "";
	action = "";
	soundEnter[]={"\A3\ui_f\data\sound\RscButton\soundEnter", 0.090000004, 1};
	soundPush[]={"\A3\ui_f\data\sound\RscButton\soundPush",  0.090000004, 1};
	soundClick[]={"\A3\ui_f\data\sound\RscButton\soundClick", 0.090000004, 1};
	soundEscape[]={"\A3\ui_f\data\sound\RscButton\soundEscape", 0.090000004, 1};
	
	class Attributes
	{
		font = "puristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	
	class AttributesImage
	{
		font = "puristaMedium";
		color = "#E5E5E5";
		align = "left";
	};
};

