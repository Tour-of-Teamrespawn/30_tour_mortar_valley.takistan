
/***************************
//BACKGROUND
***************************/
class TOUR_SI_RscBackground
{
	idc = -1; 
	type = 0;
	style = 0x00;
	colorBackground[] = {};
	colorText[] = {};
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
class TOUR_SI_RscEdit 
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
class TOUR_SI_RscText
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
	text = "SUPPORT MENU";
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
class TOUR_SI_RscSlider
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
class TOUR_SI_RscListBox {
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

class TOUR_SI_RscGUIListBox : TOUR_SI_RscListBox 
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
class TOUR_SI_RscComboBox
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
class TOUR_SI_RscButton
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
	sizeEx = "(safeZoneH / 125) + (safeZoneH / 125)";
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

/***********************
//Map Resource
***********************/
class TOUR_SI_RscMap
	{	
	idc = -1;
	access = 0;
	type = 101;
	
	style = 48;

	scaleMin = 0.005;
	scaleMax = 1;
	scaleDefault = 0.05;

	 class LineMarker
	 {
		 lineDistanceMin = 3e-005;
		 lineLengthMin = 5;
		 lineWidthThick = 0.014;
		 lineWidthThin = 0.008;
		 textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
	 };	
	
	colorBackground[] =
	{
		1,
		1,
		1,
		1
	};
	colorOutside[] =
	{
		0,
		0,
		0,
		1
	};
	colorText[] =
	{
		0,
		0,
		0,
		1
	};
	font = "puristaMedium";
	sizeEx = 0.04;
	colorSea[] =
	{
		0.46,
		0.65,
		0.74,
		0.5
	};
	colorForest[] =
	{
		0.45,
		0.64,
		0.33,
		0.5
	};
	colorRocks[] =
	{
		0,
		0,
		0,
		0.3
	};
	colorGrid[] =
	{
		1,
		1,
		1,
		1
	};
	colorGridMap[] =
	{
		1,
		1,
		1,
		1
	};
	colorTracks[] =
	{
		0,
		0,
		0,
		0.3
	};
	colorTracksFill[] =
	{
		0,
		0,
		0,
		0.3
	};
	colorRoads[] =
	{
		0.83,
		0.76,
		0.65,
		1
	};
	colorRoadsFill[] =
	{
		0.83,
		0.76,
		0.65,
		1
	};
	colorMainRoads[] =
	{
		0,
		0,
		0,
		0.3
	};
	colorMainRoadsFill[] =
	{
		0,
		0,
		0,
		0.3
	};
	colorCountlines[] =
	{
		0.85,
		0.8,
		0.65,
		1
	};
	colorMainCountlines[] =
	{
		0.45,
		0.4,
		0.25,
		1
	};
	colorCountlinesWater[] =
	{
		0.25,
		0.4,
		0.5,
		0.3
	};
	colorMainCountlinesWater[] =
	{
		0.25,
		0.4,
		0.5,
		0.9
	};
	colorForestBorder[] =
	{
		0,
		0,
		0,
		0
	};
	colorRocksBorder[] =
	{
		0,
		0,
		0,
		0
	};
	colorPowerLines[] =
	{
		0.1,
		0.1,
		0.1,
		1
	};
	colorRailWay[] =
	{
		0.8,
		0.2,
		0,
		1
	};
	colorNames[] =
	{
		0.1,
		0.1,
		0.1,
		0.9
	};
	colorInactive[] =
	{
		1,
		1,
		1,
		0.5
	};
	colorLevels[] =
	{
		0.65,
		0.6,
		0.45,
		1
	};
	stickX[] =
	{
		0.2,
		{
			"Gamma",
			1,
			1.5
		}
	};
	stickY[] =
	{
		0.2,
		{
			"Gamma",
			1,
			1.5
		}
	};
	class Legend
	{
		colorBackground[] =
		{
			0.906,
			0.901,
			0.88,
			0
		};
		color[] =
		{
			0,
			0,
			0,
			1
		};
		x = "SafeZoneX";
		y = "SafeZoneY";
		w = 0.34;
		h = 0.152;
		font = "puristaMedium";
		sizeEx = 0.03921;
	};
	class ActiveMarker
	{
		color[] =
		{
			0.3,
			0.1,
			0.9,
			1
		};
		size = 50;
	};
	class Command
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Task
	{
		colorCreated[] =
		{
			0.95,
			0.95,
			0.95,
			1
		};
		colorCanceled[] =
		{
			0.606,
			0.606,
			0.606,
			1
		};
		colorDone[] =
		{
			0.424,
			0.651,
			0.247,
			1
		};
		colorFailed[] =
		{
			0.706,
			0.0745,
			0.0196,
			1
		};
		color[] =
		{
			0.863,
			0.584,
			0,
			1
		};
		icon = "";
		iconCreated = "";
		iconCanceled = "#(argb,8,8,3)color(0,0,0,0)";
		iconDone = "";
		iconFailed = "";
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark
	{
		color[] =
		{
			0.6471,
			0.6706,
			0.6235,
			1
		};
		icon = "";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Tree
	{
		color[] =
		{
			0.45,
			0.64,
			0.33,
			0.4
		};
		icon = "";
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class SmallTree
	{
		color[] =
		{
			0.45,
			0.64,
			0.33,
			0.4
		};
		icon = "";
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bush
	{
		color[] =
		{
			0.45,
			0.64,
			0.33,
			0.4
		};
		icon = "";
		size = 14;
		importance = "0.2 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Church
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Chapel
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Cross
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "0.7 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Rock
	{
		color[] =
		{
			0.1,
			0.1,
			0.1,
			0.8
		};
		icon = "";
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bunker
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		icon = "";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fountain
	{
		color[] =
		{
			0.2,
			0.45,
			0.7,
			1
		};
		icon = "";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class ViewTower
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Lighthouse
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 14;
		importance = "3 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Quay
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Fuelstation
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.75;
		coefMax = 4;
	};
	class Hospital
	{
		color[] =
		{
			0.78,
			0,
			0.05,
			1
		};
		icon = "";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class BusStop
	{
		color[] =
		{
			0.15,
			0.26,
			0.87,
			1
		};
		icon = "";
		size = 12;
		importance = "1 * 10 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Transmitter
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Stack
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 20;
		importance = "2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Ruin
	{
		color[] =
		{
			0,
			0.9,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};
	class Tourism
	{
		color[] =
		{
			0,
			0,
			1,
			1
		};
		icon = "";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.7;
		coefMax = 4;
	};
	class Watertower
	{
		color[] =
		{
			0.2,
			0.45,
			0.7,
			1
		};
		icon = "";
		size = 20;
		importance = "1.2 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Waypoint
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "";
	};
	class WaypointCompleted
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		size = 24;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "";
	};
	class PowerSolar
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class PowerWave
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class PowerWind
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	class Shipwreck
	{
		color[] =
		{
			0,
			0,
			0,
			1
		};
		icon = "";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.9;
		coefMax = 4;
	};
	moveOnEdges = 1;
	x = "(safeZoneX + (safeZoneW / 1.67))";
	y = "(safeZoneY + (safeZoneH / 2.49))";
	w = "(safeZoneW / 4.05)";
	h = "(safeZoneH / 4.2)";
	ptsPerSquareSea = 8;
	ptsPerSquareTxt = 10;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = "6.0f";
	ptsPerSquareForEdge = "15.0f";
	ptsPerSquareRoad = "3f";
	ptsPerSquareObj = 15;
	showCountourInterval = "false";
	maxSatelliteAlpha = 0.75;
	alphaFadeStartScale = 0.15;
	alphaFadeEndScale = 0.29;
	fontLabel = "puristaMedium";
	sizeExLabel = 0.034;
	fontGrid = "puristaMedium";
	sizeExGrid = 0.03;
	fontUnits = "puristaMedium";
	sizeExUnits = 0.034;
	fontNames = "puristaMedium";
	sizeExNames = 0.056;
	fontInfo = "puristaMedium";
	sizeExInfo = 0.034;
	fontLevel = "puristaMedium";
	sizeExLevel = 0.024;
	text = "";
	widthRailWay = 1;
};

