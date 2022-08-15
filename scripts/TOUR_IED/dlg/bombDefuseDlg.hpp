#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_LISTBOX 5
#define CT_TOOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW 10
#define CT_ACTIVETEXT 11
#define CT_TREE 12
#define CT_STRUCTURED_TEXT 13
#define CT_CONTEXT_MENU 14
#define CT_CONTROLS_GROUP 15
#define CT_XKEYDESC 40
#define CT_XBUTTON 41
#define CT_XLISTBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO 44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK 98
#define CT_USER 99
#define CT_MAP 100
#define CT_MAP_MAIN 101

#define ST_POS 0x0F
#define ST_HPOS 0x03
#define ST_VPOS 0x0C
#define ST_LEFT 0x00
#define ST_RIGHT 0x01
#define ST_CENTER 0x02
#define ST_DOWN 0x04
#define ST_UP 0x08
#define ST_VCENTER 0x0c
#define ST_TYPE 0xF0
#define ST_SINGLE 0
#define ST_MULTI 16
#define ST_TITLE_BAR 32
#define ST_PICTURE 48
#define ST_FRAME 64
#define ST_BACKGROUND 80
#define ST_GROUP_BOX 96
#define ST_GROUP_BOX2 112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE 176
#define ST_SHADOW 0x100
#define ST_NO_RECT 0x200
#define ST_KEEP_ASPECT_RATIO 0x800
#define ST_TITLE ST_TITLE_BAR + ST_CENTER

class TOUR_IED_RscText
{
	access = ReadAndWrite;
	idc = -1;
	type = CT_STATIC;
	style = ST_LEFT;
	shadow = 2;
	
	x = 0.0;
	y = 0.0;
	h = 0.037;
	w = 0.3;
	
	font = "puristaMedium";
	sizeEx = 0.03921;
	colorText[] = {0.753, 0.753, 0.753, 1};
	colorBackground[] = {1, 1, 1, 0.5};
	text = "";
};
class TOUR_IED_RscStructuredText : TOUR_IED_RscText
{
	type = CT_STRUCTURED_TEXT;
	
	w = 0.1;
	h = 0.035;
	
	sizeEx = 0.027;
	size = 0.027;
	lineSpacing = 1;
	
	colorBackground[] = {0,0,0,0};
	colorText[] = {1, 1, 1, 1};
	
	class Attributes
	{
		font  = "puristaMedium";
		color = "#ffffff";
		align = "left";
		shadow = false;
		shadowColor = "#000000";
	};
};
class TOUR_IED_RscImage : TOUR_IED_RscText
{
	style = ST_PICTURE;
	w = 0.055;
	h = 0.065;
};
class TOUR_IED_RscShortcutButton
{
	idc = -1;
	type = 16;
	style = ST_LEFT;
	default = 0;
	shadow = 2;
	x = 0;
	y = 0;
	w = 0.185;
	h = 0.105;
	color[] = {1, 1, 1, 1.0};
	color2[] = {0, 0, 0, 1};
	colorBackground[] = {1, 1, 1, 1};
	colorbackground2[] = {1, 1, 1, 0.4};
	colorFocused[] = {0.75,0.75,0.75,1};
	colorBackgroundFocused[] = {0.75,0.75,0.75,1};
	colorDisabled[] = {1, 1, 1, 0.25};
	periodFocus = 1.2;
	periodOver = 0.8;
	
	class HitZone
	{
		left = 0.004;
		top = 0.029;
		right = 0.004;
		bottom = 0.029;
	};
	
	class ShortcutPos
	{
		left = 0.0145;
		top = 0.026;
		w = 0.0392157;
		h = 0.0522876;
	};
	
	class TextPos
	{
		left = 0.05;
		top = 0.034;
		right = 0.005;
		bottom = 0.005;
	};
	animTextureNormal = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\normal_ca.paa";
	animTextureDisabled = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\disabled_ca.paa";
	animTextureOver = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\over_ca.paa";
	animTextureFocused = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\focus_ca.paa";
	animTexturePressed = "\a3\ui_f\data\gui\RscCommon\RscShortcutButtonMain\down_ca.paa";
	animTextureDefault = "\a3\ui_f\data\gui\RscCommon\RscShortcutButton\background_ca.paa";
	period = 0.4;
	font = "puristaMedium";
	size = 0.03921;
	sizeEx = 0.03921;
	text = "";
	soundEnter[]={"\A3\ui_f\data\sound\RscButton\soundEnter", 0.090000004, 1};
	soundPush[]={"\A3\ui_f\data\sound\RscButton\soundPush",  0.090000004, 1};
	soundClick[]={"\A3\ui_f\data\sound\RscButton\soundClick", 0.090000004, 1};
	soundEscape[]={"\A3\ui_f\data\sound\RscButton\soundEscape", 0.090000004, 1};
	textureNoShortcut = "";
	action = "";
	
	class Attributes
	{
		font = "puristaMedium";
		color = "#ffffff";
		align = "left";
		shadow = "true";
	};
	
	class AttributesImage
	{
		font = "puristaMedium";
		color = "#ffffff";
		align = "left";
	};
};

#define __posX 0.05
#define __posY 0.275
#define __sizeX 0.9
#define __sizeY 0.45
class TOUR_IED_bombDefuseQ
{
	idd = 314158;
	movingEnable = 0;
	controlsBackground[] = {"Background", "Header", "HelpText"};
	objects[] = {};
	controls[] = {"BtnYes", "BtnNo"};
	onLoad = "TOUR_IED_defuseAgree = false; ""dynamicBlur"" ppEffectEnable true; ""dynamicBlur"" ppEffectAdjust [1.6]; ""dynamicBlur"" ppEffectCommit 0;";
	onUnload = """dynamicBlur"" ppEffectEnable false;";
	onKeyDown = "null = _this execVM ""scripts\TOUR_IED\bombDefuseKey.sqf"";";
	
	class Background : TOUR_IED_RscText
	{
		colorBackground[] = {0, 0, 0, 0.5};
		style = 128;
		x = __posX;
		y = __posY;
		w = __sizeX;
		h = __sizeY;
	};
	class Header : TOUR_IED_RscStructuredText
	{
		x = __posX;
		y = __EVAL(__posY + 0.03);
		w = __sizeX;
		h = 0.1;
		size = 0.07;
		text = "IED DEFUSAL";
		
		class Attributes
		{
			font  = "puristaMedium";
			color = "#FF0000";
			align = "center";
			shadow = true;
		};
	};
	class HelpText : Header
	{
		x = __EVAL(__posX + 0.05);
		y = __EVAL(__posY + 0.15);
		w = __EVAL(__sizeX - 0.1);
		h = 0.2;
		size = 0.032;
		text = "You are not a trained EOD operative. Defusing the IED is probably not a good idea...<br/>Are you sure you want to try anyway?";
		
		class Attributes
		{
			font  = "puristaMedium";
			color = "#ffffff";
			align = "left";
			shadow = false;
		};
	};
	class BtnYes : TOUR_IED_RscShortcutButton
	{	
		x = __EVAL(__posX + 0.25);
		y = __EVAL(__posY + 0.30);
		text = "Yes";
		action = "closeDialog 314159; TOUR_IED_defuseAgree = true;";
	};
	class BtnNo : BtnYes
	{
		x = __EVAL(__posX + 0.475);
		text = "No";
		action = "closeDialog 314159;";
	};
};

#define __posX 0.05
#define __posY 0.175
#define __sizeX 0.9
#define __sizeY 0.65
class TOUR_IED_bombDefuse
{
	idd = 314159;
	movingEnable = 0;
	controlsBackground[] = {"Background", "Header", "HelpText", "TimeLeftText", "TimeLeftValue", "SequenceText", "Sequence1Bg", "Sequence1Pic", "Sequence2Bg", "Sequence2Pic", "Sequence3Bg", "Sequence3Pic", "Sequence4Bg", "Sequence4Pic", "Sequence5Bg", "Sequence5Pic", "Sequence6Bg", "Sequence6Pic", "Sequence7Bg", "Sequence7Pic", "Sequence8Bg", "Sequence8Pic"};
	objects[] = {};
	controls[] = {"BtnStart", "BtnCancel"};
	onLoad = "TOUR_IED_defuseSequence = """"; ""dynamicBlur"" ppEffectEnable true; ""dynamicBlur"" ppEffectAdjust [1.6]; ""dynamicBlur"" ppEffectCommit 0;";
	onUnload = """dynamicBlur"" ppEffectEnable false;";
	onKeyDown = "null = _this execVM ""scripts\TOUR_IED\bombDefuseKey.sqf"";";
	
	class Background : TOUR_IED_RscText
	{
		colorBackground[] = {0, 0, 0, 0.5};
		style = 128;
		x = __posX;
		y = __posY;
		w = __sizeX;
		h = __sizeY;
	};
	class Header : TOUR_IED_RscStructuredText
	{
		x = __posX;
		y = __EVAL(__posY + 0.03);
		w = __sizeX;
		h = 0.1;
		size = 0.07;
		text = "IED DEFUSAL";
		
		class Attributes
		{
			font  = "puristaMedium";
			color = "#FF0000";
			align = "center";
			shadow = true;
		};
	};
	class HelpText : Header
	{
		x = __EVAL(__posX + 0.05);
		y = __EVAL(__posY + 0.15);
		w = __EVAL(__sizeX - 0.1);
		h = 0.2;
		size = 0.032;
		text = "Use <t font='puristaMedium'>ARROW LEFT</t> / <t font='puristaMedium'>ARROW RIGHT</t> to enter the correct sequence to successfuly defuse the bomb. If choose wrong you will have to repeat the whole sequence again.<br/>If you run out of time, get shot or interrupt the defusal proccess it is very likely the bomb will go off.";
		
		class Attributes
		{
			font  = "puristaMedium";
			color = "#FFFFFF";
			align = "left";
			shadow = false;
		};
	};
	class BtnStart : TOUR_IED_RscShortcutButton
	{
		idc = 1;
		x = __EVAL(__posX + 0.25);
		y = __EVAL(__posY + 0.33);
		text = "Start";
		action = "closeDialog 314159; TOUR_IED_defuseStart = true;";
	};
	class BtnCancel : BtnStart
	{
		idc = 2;
		x = __EVAL(__posX + 0.475);
		text = "Cancel";
		action = "closeDialog 314159;";
	};
	class TimeLeftText : Header
	{
		x = __EVAL(__posX + 0.05);
		y = __EVAL(__posY + 0.45);
		w = 0.3;
		h = 0.1;
		size = 0.04;
		text = "Time left:";
		
		class Attributes
		{
			font  = "puristaMedium";
			color = "#FFFFFF";
			align = "left";
			shadow = false;
		};
	};
	class TimeLeftValue : Background
	{
		idc = 5;
		x = __EVAL(__posX + 0.22);
		y = __EVAL(__posY + 0.445);
		colorBackground[] = {1, 1, 1, 1.0};
		w = 0.6;
		h = 0.05;
	};
	class SequenceText : TimeLeftText
	{
		y = __EVAL(__posY + 0.53);
		text = "Sequence:";
	};
	class Sequence1Bg : Background
	{
		idc = 11;
		x = __EVAL(__posX + 0.22);
		y = __EVAL(__posY + 0.51);
		w = 0.07;
		h = 0.09;
	};
	class Sequence1Pic : TOUR_IED_RscImage
	{
		idc = 21;
		x = __EVAL(__posX + 0.227);
		y = __EVAL(__posY + 0.52);
		text = "scripts\TOUR_IED\dlg\unknown.paa";
	};
	class Sequence2Bg : Sequence1Bg
	{
		idc = 12;
		x = __EVAL(__posX + 0.30);
	};
	class Sequence2Pic : Sequence1Pic
	{
		idc = 22;
		x = __EVAL(__posX + 0.307);
	};
	class Sequence3Bg : Sequence1Bg
	{
		idc = 13;
		x = __EVAL(__posX + 0.38);
	};
	class Sequence3Pic : Sequence1Pic
	{
		idc = 23;
		x = __EVAL(__posX + 0.387);
	};
	class Sequence4Bg : Sequence1Bg
	{
		idc = 14;
		x = __EVAL(__posX + 0.46);
	};
	class Sequence4Pic : Sequence1Pic
	{
		idc = 24;
		x = __EVAL(__posX + 0.467);
	};
	class Sequence5Bg : Sequence1Bg
	{
		idc = 15;
		x = __EVAL(__posX + 0.54);
	};
	class Sequence5Pic : Sequence1Pic
	{
		idc = 25;
		x = __EVAL(__posX + 0.547);
	};
	class Sequence6Bg : Sequence1Bg
	{
		idc = 16;
		x = __EVAL(__posX + 0.62);
	};
	class Sequence6Pic : Sequence1Pic
	{
		idc = 26;
		x = __EVAL(__posX + 0.627);
	};
	class Sequence7Bg : Sequence1Bg
	{
		idc = 17;
		x = __EVAL(__posX + 0.70);
	};
	class Sequence7Pic : Sequence1Pic
	{
		idc = 27;
		x = __EVAL(__posX + 0.707);
	};
	class Sequence8Bg : Sequence1Bg
	{
		idc = 18;
		x = __EVAL(__posX + 0.78);
	};
	class Sequence8Pic : Sequence1Pic
	{
		idc = 28;
		x = __EVAL(__posX + 0.787);
	};
	class TOUR_IED_dlg_logo : TOUR_IED_RscImage
	{
		idc = 29;
		x = __EVAL(__posX + 0.1);
		y = __EVAL(__posY + 0.1);
		text = "scripts\TOUR_IED\img\logo.paa";
	};
};
