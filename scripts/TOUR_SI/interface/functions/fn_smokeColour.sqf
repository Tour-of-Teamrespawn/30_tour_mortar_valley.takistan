private ["_smoke", "_colour"];
_smoke = _this;
_colour = switch (typeOf _smoke) do
{
	case "SmokeShell" : { "white" };
	case "SmokeShellRed": { "red" };
	case "SmokeShellGreen": { "green" };
	case "SmokeShellYellow": { "yellow" };
	case "SmokeShellPurple": { "purple" };
	case "SmokeShellBlue": { "blue" };
	case "SmokeShellOrange": { "orange" };
	case "G_40mm_Smoke": { "white" };
	case "G_40mm_SmokeRed": { "red" };
	case "G_40mm_SmokeGreen": { "green" };
	case "G_40mm_SmokeYellow": { "yellow" };
	case "G_40mm_SmokePurple": { "purple" };
	case "G_40mm_SmokeBlue": { "blue" };
	case "G_40mm_SmokeOrange": { "orange" };
	case "rhs_ammo_m18_red": { "red" };
	case "rhs_ammo_m18_green": { "green" };
	case "rhs_ammo_m18_yellow": { "yellow" };
	case "rhs_ammo_m18_purple": { "purple" };
	case "rhs_ammo_m18_blue": { "blue" };
	case "rhs_ammo_m18_orange": { "orange" };
	case DEFAULT { "some" };
};
hint str _colour;
_colour;
