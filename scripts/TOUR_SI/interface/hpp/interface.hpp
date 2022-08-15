#include "common.hpp"
#include "setup.hpp"

class TOUR_SI_dlg_interface
{
	idd = 121220;
	onLoad = "_this call TOUR_SI_fnc_onLoad";
	onUnload = "_this call TOUR_SI_fnc_onUnload";

	class controlsBackground
	{
		class TOUR_SI_dlg_background : TOUR_SI_RscBackground
		{
			idc = -1;
			x = "(safeZoneX + (safeZoneW / 6))";
			y = "(safeZoneY + (safeZoneH / 6.8))";
			w = "(safeZoneW / 1.5)";
			h = "(safeZoneH / 1.42)";
			colorBackground[] = { 0, 0, 0, 0.8 };
			text = "";
			moving = 0;
		};

		class TOUR_SI_dlg_logo : TOUR_SI_RscBackground
		{
			idc = -1;
			style = 48;
			x = "safeZoneX + (safeZoneW / 5.35)";
			y = "safeZoneY + (safeZoneH / 5.6)";
			w = "(safeZoneW / 30)";
			h = "(safeZoneH / 30)";
			text = "scripts\TOUR_SI\interface\img\logo.paa";
		};

		class TOUR_SI_dlg_textMain : TOUR_SI_RscText
		{
			idc = 121221;
			x = "(safeZoneX + (safeZoneW / 5.35))";
			y = "safeZoneY + (safeZoneH / 3.8)";
			w = "(safeZoneW / 3.161)";
			h = "(safeZoneH / 4)";
			text = "";
			colorBackground[] = { 1, 1, 1, 0.05 };
			class Attributes 
			{
				align = "center";
				valign = "middle";
				shadowColor = "#000000";
				color = "#FFFFFF";
				size = "2";
			};
		};
		
		class TOUR_SI_dlg_titleText : TOUR_SI_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 4.5)";
			y = "safeZoneY + (safeZoneH / 5.73)";
			w = "safeZoneW / 3.50";
			h = "safeZoneH / 25";
			text = "SUPPORT INTERFACE";
			colorBackground[] = { 0,0,0,0 };
			class Attributes
			{
				align = "left";
				color = "#D7DF01";
				size = "2";
			};
		};
		
		class TOUR_SI_dlg_title2Text : TOUR_SI_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 4.5)";
			y = "safeZoneY + (safeZoneH / 4.5)";
			w = "safeZoneW / 2.6";
			h = "safeZoneH / 50";
			text = "RADIO SUPPORT MENU";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes 
			{
				align = "left";
				color = "#D7DF01";
				size = "1";
			};
		};

		class TOUR_SI_dlg_textSupportType : TOUR_SI_RscText
		{
			idc = 121222;
			x = "safeZoneX + (safeZoneW / 9.5)";
			y = "safeZoneY + (safeZoneH / 1.9)";
			w = "safeZoneW / 5.25";
			h = "safeZoneH / 50";
			text = "TYPE OF SUPPORT:";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes 
			{
				align = "right";
				valign = "middle";
				color = "#D7DF01";
				shadowColor = "#000000";
				size = "0.8";
			};
		};
		
		class TOUR_SI_dlg_textUnit : TOUR_SI_RscText
		{
			idc = 121223;
			x = "safeZoneX + (safeZoneW / 9.5)";
			y = "safeZoneY + (safeZoneH / 1.8)";
			w = "safeZoneW / 5.25";
			h = "safeZoneH / 50";
			text = "UNIT:";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes 
			{
				align = "right";
				valign = "middle";
				color = "#D7DF01";
				shadowColor = "#000000";
				size = "0.8";
			};
		};

		class TOUR_SI_dlg_text1 : TOUR_SI_dlg_textUnit
		{
			idc = 121224;
			x = "safeZoneX + (safeZoneW / 9.5)";
			y = "safeZoneY + (safeZoneH / 1.715)";
			text = "TYPE OF SHELLS:";
		};
		
		class TOUR_SI_dlg_text2 : TOUR_SI_dlg_text1
		{
			idc = 121225;
			x = "safeZoneX + (safeZoneW / 9.5)";
			y = "safeZoneY + (safeZoneH / 1.635)";
			text = "AMOUNT OF SHELLS:";
		};
		
		class TOUR_SI_dlg_text3 : TOUR_SI_dlg_text1
		{
			idc = 121226;
			x = "safeZoneX + (safeZoneW / 9.5)";
			y = "safeZoneY + (safeZoneH / 1.564)";
			text = "DISPERSION RADIUS:";
		};
		
		class TOUR_SI_dlg_text4 : TOUR_SI_dlg_text1
		{
			idc = 121227;
			x = "safeZoneX + (safeZoneW / 9.5)";
			y = "safeZoneY + (safeZoneH / 1.498)";
			text = "INTERVAL BETWEEN ROUNDS:";
		};

		class TOUR_SI_dlg_text5 : TOUR_SI_dlg_text1
		{
			idc = 121228;
			x = "safeZoneX + (safeZoneW / 9.5)";
			y = "safeZoneY + (safeZoneH / 1.441)";
			text = "BEHAVIOUR:";
		};

	};

	class controls
	{
		class TOUR_SI_dlg_map : TOUR_SI_RscMap
		{
			idc = 121230;
			x = "(safeZoneX + (safeZoneW / 1.9))";
			y = "(safeZoneY + (safeZoneH / 3.8))";
			w = "(safeZoneW / 3.5)";
			h = "(safeZoneH / 2.2)";
		};
		
		class TOUR_SI_dlg_buttonExecute : TOUR_SI_RscButton
		{
			idc = 121231;
			default = 0;
			x = "safeZoneX + (safeZoneW / 5.35)";
			y = "safeZoneY + (safeZoneH / 1.38)";
			w = "safeZoneW / 3.161";
			h = "safeZoneH / 20";
			text = "EXECUTE FIRE MISSION";
			class Attributes
			{
				font = "puristaMedium";
				color = "#E5E5E5";
				align = "center";
			};
		};

		class TOUR_SI_dlg_buttonEnd : TOUR_SI_dlg_buttonExecute
		{
			idc = 121232;
			default = 0;
			x = "safeZoneX + (safeZoneW / 1.93)";
			y = "safeZoneY + (safeZoneH / 1.38)";
			w = "safeZoneW / 3.161";
			h = "safeZoneH / 20";
			text = "END MISSION";
			class Attributes
			{
				font = "puristaMedium";
				color = "#E5E5E5";
				align = "center";
			};
		};		
		
		class TOUR_SI_dlg_buttonInfo : TOUR_SI_dlg_buttonExecute
		{
			idc = 121233;
			default = 0;
			x = "safeZoneX + (safeZoneW / 1.93)";
			y = "safeZoneY + (safeZoneH / 1.27)";
			w = "safeZoneW / 3.161";
			h = "safeZoneH / 20";
			text = "REQUEST ENEMY INFO";
			class Attributes
			{
				font = "puristaMedium";
				color = "#E5E5E5";
				align = "center";
			};
		};
		
		class TOUR_SI_dlg_buttonConfirm : TOUR_SI_dlg_buttonExecute
		{
			idc = 121234;
			default = 0;
			x = "safeZoneX + (safeZoneW / 5.3)";
			y = "safeZoneY + (safeZoneH / 1.27)";
			w = "safeZoneW / 7.161";
			h = "safeZoneH / 20";
			//x = "safeZoneX + (safeZoneW / 5.35)";
			//y = "safeZoneY + (safeZoneH / 1.27)";
			//w = "safeZoneW / 4.161";
			//h = "safeZoneH / 20";
			text = "CONFIRM SMOKE";
			class Attributes
			{
				font = "puristaMedium";
				color = "#E5E5E5";
				align = "center";
			};
		};
		
		class TOUR_SI_dlg_buttonReject : TOUR_SI_dlg_buttonExecute
		{
			idc = 121235;
			default = 0;
			x = "safeZoneX + (safeZoneW / 2.75)";
			y = "safeZoneY + (safeZoneH / 1.27)";
			w = "safeZoneW / 7.161";
			h = "safeZoneH / 20";
			text = "REJECT SMOKE";
			class Attributes
			{
				font = "puristaMedium";
				color = "#E5E5E5";
				align = "center";
			};
		};

		class TOUR_SI_dlg_comboSupportType : TOUR_SI_RscComboBox
		{
			idc = 121240;
			x = "safeZoneX + (safeZoneW / 3.2)";
			y = "safeZoneY + (safeZoneH / 1.905)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};
		
		class TOUR_SI_dlg_comboVehicleType : TOUR_SI_RscComboBox
		{
			idc = 121241;
			x = "safeZoneX + (safeZoneW / 3.2)";
			y = "safeZoneY + (safeZoneH / 1.81)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};
		
		class TOUR_SI_dlg_comboType : TOUR_SI_RscComboBox
		{
			idc = 121242;
			x = "safeZoneX + (safeZoneW / 3.2)";
			y = "safeZoneY + (safeZoneH / 1.72)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};
		
		class TOUR_SI_dlg_sliderAmountHeight : TOUR_SI_RscSlider
		{
			idc = 121243;
			x = "safeZoneX + (safeZoneW / 3.2)";
			y = "safeZoneY + (safeZoneH / 1.638)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};
		
		class TOUR_SI_dlg_sliderRadius : TOUR_SI_dlg_sliderAmountHeight
		{
			idc = 121244;
			y = "safeZoneY + (safeZoneH / 1.568)";
		};
		
		class TOUR_SI_dlg_sliderIntervalSpeed : TOUR_SI_dlg_sliderAmountHeight
		{
			idc = 121245;
			y = "safeZoneY + (safeZoneH / 1.503)";
		};
		
		class TOUR_SI_dlg_comboCommandBehaviour : TOUR_SI_RscComboBox
		{
			idc = 121246;
			x = "safeZoneX + (safeZoneW / 3.2)";
			y = "safeZoneY + (safeZoneH / 1.44125)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};	
		
		class TOUR_SI_dlg_creButtonCancel : TOUR_SI_RscButton
		{
			idc = -1;
			default = 0;
			action = "closeDialog 0";
			text = "X";
			x = "(safeZoneX + (safeZoneW / 1.31))";
			y = "safeZoneY + (safeZoneH / 5.6)";
			w = "(safeZoneW / 20)";
			h = "safeZoneH / 20";
			class Attributes
			{
				font = "puristaMedium";
				color = "#E5E5E5";
				align = "center";
			};
		};
	};
};
