#include "common.hpp"

class TOUR_RC_dlg_adminTool
{
	idd = 201800;
	onLoad = "_this call TOUR_RC_dlg_fnc_onload";
	onUnload = "_this call TOUR_RC_dlg_fnc_onUnLoad";

	class controlsBackground
	{	
		class TOUR_RC_dlg_background : TOUR_RC_RscBackground
		{
			idc = -1;
			x = "(safeZoneX + (safeZoneW / 3.8))";
			y = "(safeZoneY + (safeZoneH / 6))";
			w = "(safeZoneW / 2.1)";
			h = "(safeZoneH / 1.7)";
			text = "";
			colorBackground[] = { 0, 0, 0, 0.7 };
		};		
		
		class TOUR_RC_dlg_logo : TOUR_RC_RscBackground
		{
			idc = -1;
			style = 48;
			x = "safeZoneX + (safeZoneW / 3.45)";
			y = "safeZoneY + (safeZoneH / 4.85)";
			w = "(safeZoneW / 30)";
			h = "(safeZoneH / 30)";
			text = "scripts\TOUR_RC\dialog\img\logo.paa";
		};
		
		class TOUR_RC_dlg_textMain : TOUR_RC_RscText
		{
			idc = 201801;
			x = "(safeZoneX + (safeZoneW / 1.9))";
			y = "safeZoneY + (safeZoneH / 3.4)";
			w = "(safeZoneW / 5.4)";
			h = "(safeZoneH / 3)";
			text = "";
			colorBackground[] = { 1, 1, 1, 0.05 };
			class Attributes 
			{
				align = "center";
				valign = "middle";
				shadowColor = "#000000";
				color = "#FFFFFF";
				size = "1";
			};
		};
		
		class TOUR_RC_dlg_titleText : TOUR_RC_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 2.4)";
			y = "safeZoneY + (safeZoneH / 5)";
			w = "safeZoneW / 3.50";
			h = "safeZoneH / 25";
			text = "Respawn Control";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes
			{
				color = "#FFFFFF";
				size = "2";
			};
		};

		class TOUR_RC_dlg_params : TOUR_RC_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 6.8)";
			y = "safeZoneY + (safeZoneH / 3.43)";
			w = "safeZoneW / 2.6";
			h = "safeZoneH / 50";
			text = "Respawn Parameters:";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes 
			{
				align = "center";
				valign = "middle";
				color = "#FFFFFF";
				size = "1";
			};
		};

		class TOUR_RC_dlg_textControl : TOUR_RC_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 7.4)";
			y = "safeZoneY + (safeZoneH / 1.825)";
			w = "safeZoneW / 2.6";
			h = "safeZoneH / 50";
			text = "Control Buttons:";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes 
			{
				align = "center";
				valign = "middle";
				color = "#FFFFFF";
				size = "1";
			};
		};
		
		class TOUR_RC_dlg_textSlots : TOUR_RC_RscText
		{
			idc = 201802;
			x = "(safeZoneX + (safeZoneW / 1.9))";
			y = "safeZoneY + (safeZoneH / 1.55)";
			w = "(safeZoneW / 5.4)";
			h = "(safeZoneH / 19)";
			text = "Slots Unlocked";
			colorBackground[] = { 0, 0, 0, 0.1 };
			class Attributes 
			{
				align = "center";
				valign = "middle";
				shadowColor = "#000000";
				color = "#FFFF00";
				size = "1.7";
			};
		};

		class TOUR_RC_dlg_textLives : TOUR_RC_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 3.35)";
			y = "safeZoneY + (safeZoneH / 3.0)";
			w = "safeZoneW / 5.25";
			h = "safeZoneH / 50";
			text = "Number of Lives";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes 
			{
				align = "Left";
				valign = "right";
				shadowColor = "#000000";
				size = "0.8";
			};
		};	
		
		class TOUR_RC_dlg_textTime : TOUR_RC_dlg_textLives
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.6)";
			text = "Respawn Delay";
		};
		
		class TOUR_RC_dlg_textType : TOUR_RC_dlg_textLives
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.3)";
			text = "Clear Dead UIDs";
		};
		
		class TOUR_RC_dlg_textoplayer : TOUR_RC_dlg_textLives
		{
			idc = -1;
			y = "safeZoneY + (safeZoneH / 2.055)";
			text = "Respawn Player";
		};		
	};
	
	class controls
	{
		class TOUR_RC_dlg_comboLives : TOUR_RC_RscComboBox
		{
			idc = 201803;
			x = "safeZoneX + (safeZoneW / 3.30)";
			y = "safeZoneY + (safeZoneH / 2.8)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};

		class TOUR_RC_dlg_sliderTime : TOUR_RC_RscSlider
		{
			idc = 201804;
			y = "safeZoneY + (safeZoneH / 2.45)";
			x = "safeZoneX + (safeZoneW / 3.30)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};		
		
		class TOUR_dlg_comboType : TOUR_RC_RscComboBox
		{
			idc = 201805;
			x = "safeZoneX + (safeZoneW / 3.30)";
			y = "safeZoneY + (safeZoneH / 2.175)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};	
		
		class TOUR_dlg_comboplayer : TOUR_RC_RscComboBox
		{
			idc = 201809;
			x = "safeZoneX + (safeZoneW / 3.30)";
			y = "safeZoneY + (safeZoneH / 1.95)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};	
	
		class TOUR_RC_dlg_ButtonCancel : TOUR_RC_RscButton
		{
			idc = 201806;
			action = "closeDialog 0";
			text = "X";
			x = "(safeZoneX + (safeZoneW / 1.472))";
			y = "safeZoneY + (safeZoneH / 5.67)";
			w = "(safeZoneW / 20)";
			h = "safeZoneH / 20";
			default = 1;
			class Attributes
			{
				align = "left";
			};

		};

		class TOUR_RC_dlg_buttonCommit : TOUR_RC_RscButton
		{
			idc = 201807;
			text = "Commit Changes";
			x = "(safeZoneX + (safeZoneW / 3.30))";
			y = "safeZoneY + (safeZoneH / 1.7)";
			w = "(safeZoneW / 8)";
			h = "safeZoneH / 20";
		};	
		
		class TOUR_RC_dlg_buttonSlots : TOUR_RC_dlg_buttonCommit
		{
			idc = 201808;
			y = "safeZoneY + (safeZoneH / 1.54)";
			h = "safeZoneH / 20";
			text = "Lock Slots";
		};

	};
};
