
class TOUR_SI_dlg_interfaceSetup
{
	idd = 121320;
	onLoad = "_this call TOUR_SI_fnc_onLoadSetup";
	onUnload = "_this call TOUR_SI_fnc_onUnloadSetup";

	class controlsBackground
	{
		class TOUR_SI_dlg_backgroundSetup : TOUR_SI_RscBackground
		{
			idc = -1;
			x = "(safeZoneX + (safeZoneW / 6))";
			y = "(safeZoneY + (safeZoneH / 6.75))";
			w = "(safeZoneW / 2.8)";
			h = "(safeZoneH / 1.95)";
			colorBackground[] = { 0, 0, 0, 0.7 };
			text = "";
			moving = 0;
		};

		class TOUR_SI_dlg_logoSetup : TOUR_SI_RscBackground
		{
			idc = -1;
			style = 48;
			x = "safeZoneX + (safeZoneW / 5.35)";
			y = "safeZoneY + (safeZoneH / 5.6)";
			w = "(safeZoneW / 30)";
			h = "(safeZoneH / 30)";
			text = "scripts\TOUR_SI\interface\img\logo.paa";
		};

		class TOUR_SI_dlg_textMainSetup : TOUR_SI_RscText
		{
			idc = 121321;
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
		
		class TOUR_SI_dlg_titleTextSetup : TOUR_SI_RscText
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
		
		class TOUR_SI_dlg_title2TextSetup : TOUR_SI_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 4.5)";
			y = "safeZoneY + (safeZoneH / 4.5)";
			w = "safeZoneW / 2.6";
			h = "safeZoneH / 50";
			text = "CONFIGURATION MENU";
			colorBackground[] = { 0, 0, 0, 0 };
			class Attributes 
			{
				align = "left";
				color = "#D7DF01";
				size = "1";
			};
		};
	
		class TOUR_SI_dlg_textTypeSetup : TOUR_SI_RscText
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 9.5)";
			y = "safeZoneY + (safeZoneH / 1.9)";
			w = "safeZoneW / 5.25";
			h = "safeZoneH / 50";
			text = "TYPE OF SHELLS:";
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

		class TOUR_SI_dlg_textAmountSetup : TOUR_SI_dlg_textTypeSetup
		{
			idc = -1;
			x = "safeZoneX + (safeZoneW / 9.5)";
			y = "safeZoneY + (safeZoneH / 1.8)";
			text = "AMOUNT OF SHELLS:";
		};
	};

	class controls
	{
		
		class TOUR_SI_dlg_buttonExecuteSetup : TOUR_SI_RscButton
		{
			idc = 121322;
			default = 0;
			x = "safeZoneX + (safeZoneW / 5.35)";
			y = "safeZoneY + (safeZoneH / 1.7)";
			w = "safeZoneW / 3.161";
			h = "safeZoneH / 20";
			text = "UPDATE SETTINGS";
			class Attributes
			{
				font = "puristaMedium";
				color = "#E5E5E5";
				align = "center";
			};
		};
		
		class TOUR_SI_dlg_comboRoundsTypeSetup : TOUR_SI_RscComboBox
		{
			idc = 121323;
			x = "safeZoneX + (safeZoneW / 3.2)";
			y = "safeZoneY + (safeZoneH / 1.905)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};		

		class TOUR_SI_dlg_sliderAmountSetup : TOUR_SI_RscSlider
		{
			idc = 121324;
			x = "safeZoneX + (safeZoneW / 3.2)";
			y = "safeZoneY + (safeZoneH / 1.81)";
			w = "(safeZoneW / 5.25)";
			h = "(safeZoneH / 50)";
		};
		
		class TOUR_SI_dlg_creButtonCancelSetup : TOUR_SI_RscButton
		{
			idc = -1;
			default = 0;
			action = "closeDialog 0";
			text = "X";
			x = "(safeZoneX + (safeZoneW / 2.2))";
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
