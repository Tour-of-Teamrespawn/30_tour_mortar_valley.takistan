# If you have installed everything with defaults then this is likely to be the only variable you need
# to touch.
# KEEP THE "v" before the version!
# Tour (proposed) mission naming standard like:
#   "30 [Tour] MISSION NAME v1.1"
#   "30 [Tour] Operation Bitemark v1.0"
$MissionName_withV = "30[Tour] Mortar Valley v"

###################################################################################################

# Set your base folder for Arma 3
$Arma3InstallFolder = 'C:\Program Files (x86)\Steam\steamapps\common\Arma 3'

# Set your base folder for the Arma 3 Tools
$Arma3ToolsFolder = 'C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools'

# Where to save the resulting PBO, set to MPMissions for easy local testing
$OutputPath = "$Arma3InstallFolder\MPMissions"

# Path to FileBank, part of the Arma 3 Tools steam download
$FileBank_EXE = "$Arma3ToolsFolder\FileBank\FileBank.exe"

###################################################################################################
# Local dedicated server related variables.

# dedicated server exe path path, usually same folder as client arma3.exe
$A3_Server = "$Arma3InstallFolder\arma3server_x64.exe"

# path to server config file
$A3_Server_Config = "$Arma3InstallFolder\server.cfg"

$ClientModList = @(
    "$Arma3InstallFolder\!Workshop\@CUP Terrains - Core",
    "$Arma3InstallFolder\!Workshop\@CUP Terrains - Maps",
    "$Arma3InstallFolder\!Workshop\@CBA_A3",
    "$Arma3InstallFolder\!Workshop\@RKSL Studios - Attachments v3.02",
    "$Arma3InstallFolder\!Workshop\@RHSAFRF",
    "$Arma3InstallFolder\!Workshop\@RHSUSAF",
    "$Arma3InstallFolder\!Workshop\@JSRS SOUNDMOD",
    "$Arma3InstallFolder\!Workshop\@3CB BAF Vehicles",
    "$Arma3InstallFolder\!Workshop\@3CB BAF Weapons",
    "$Arma3InstallFolder\!Workshop\@3CB BAF Equipment",
    "$Arma3InstallFolder\!Workshop\@RHSGREF",
    "$Arma3InstallFolder\!Workshop\@TOT",
    "$Arma3InstallFolder\!Workshop\@3CB BAF Units",
    "$Arma3InstallFolder\!Workshop\@CUP Terrains - Maps 2.0",
    "$Arma3InstallFolder\!Workshop\@Jbad",
    "$Arma3InstallFolder\!Workshop\@LYTHIUM",
    "$Arma3InstallFolder\!Workshop\@RHSSAF",
    "$Arma3InstallFolder\!Workshop\@ace",
    "$Arma3InstallFolder\!Workshop\@JSRS SOUNDMOD - RHS USAF Mod Pack Sound Support",
    "$Arma3InstallFolder\!Workshop\@JSRS SOUNDMOD - RHS  AFRF Mod Pack Sound Support",
    "$Arma3InstallFolder\!Workshop\@ACRE2",
    "$Arma3InstallFolder\!Workshop\@ACE Compat - RHS- SAF",
    "$Arma3InstallFolder\!Workshop\@3CB Factions",
    "$Arma3InstallFolder\!Workshop\@ACE Compat - RHS USAF",
    "$Arma3InstallFolder\!Workshop\@ACE Compat - RHS AFRF",
    "$Arma3InstallFolder\!Workshop\@ACE Compat - RHS- GREF",
    "$Arma3InstallFolder\!Workshop\@JSRS SOUNDMOD - RHS SAF Mod Pack Support",
    "$Arma3InstallFolder\!Workshop\@JSRS SOUNDMOD - Reloading Sounds",
    "$Arma3InstallFolder\!Workshop\@JSRS SOUNDMOD - RHS GREF Mod Pack Sound Support",
    "$Arma3InstallFolder\!Workshop\@3CB BAF Units (RHS compatibility)",
    "$Arma3InstallFolder\!Workshop\@3CB BAF Weapons (RHS ammo compatibility)",
    "$Arma3InstallFolder\!Workshop\@3CB BAF Vehicles (RHS reskins)"
)

$ServerModList = @(
    "$Arma3InstallFolder\!Workshop\@LAMBS_Danger.fsm",
    "$Arma3InstallFolder\!Workshop\@LAMBS_RPG",
    "$Arma3InstallFolder\!Workshop\@LAMBS_RPG_RHS",
    "$Arma3InstallFolder\!Workshop\@LAMBS_Suppression",
    "$Arma3InstallFolder\!Workshop\@LAMBS_Turrets"
)