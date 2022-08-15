###################################################################################################
# Variable setup
###################################################################################################

$ErrorActionPreference = 'Stop'
if (($null -eq $PSScriptRoot) -or ([System.String]::IsNullOrWhiteSpace($PSScriptRoot))) {
    # assume we are in the root of the mission folder (same as this file)
    $ProjectRoot = (Get-Location).Path
}
else {
    $ProjectRoot = $PSScriptRoot
}
$MissionFolderName = Split-Path $ProjectRoot -Leaf

# Path to FileBank, part of the Arma 3 Tools steam download
$FileBank_EXE = 'C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools\FileBank\FileBank.exe'

# Where to save the resulting PBO, set to MPMissions for easy local testing
$OutputPath = 'C:\Program Files (x86)\Steam\steamapps\common\Arma 3\MPMissions'

# dedicated server path
$A3_Server = 'C:\Program Files (x86)\Steam\steamapps\common\Arma 3\arma3server_x64.exe'

$A3_Server_Config = "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\server.cfg"

$MissionName_withV = "30 [TOUR] Mortar Valley V" # assumed to be like "30 [Tour] Operation Haystack v1.1"

$ClientModList = @(
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@CUP Terrains - Core",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@CUP Terrains - Maps",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@CBA_A3",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@RKSL Studios - Attachments v3.02",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@RHSAFRF",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@RHSUSAF",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@JSRS SOUNDMOD",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@3CB BAF Vehicles",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@3CB BAF Weapons",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@3CB BAF Equipment",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@RHSGREF",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@TOT",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@3CB BAF Units",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@CUP Terrains - Maps 2.0",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@Jbad",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@LYTHIUM",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@RHSSAF",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@ace",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@JSRS SOUNDMOD - RHS USAF Mod Pack Sound Support",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@JSRS SOUNDMOD - RHS  AFRF Mod Pack Sound Support",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@ACRE2",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@ACE Compat - RHS- SAF",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@3CB Factions",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@ACE Compat - RHS USAF",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@ACE Compat - RHS AFRF",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@ACE Compat - RHS- GREF",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@JSRS SOUNDMOD - RHS SAF Mod Pack Support",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@JSRS SOUNDMOD - Reloading Sounds",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@JSRS SOUNDMOD - RHS GREF Mod Pack Sound Support",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@3CB BAF Units (RHS compatibility)",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@3CB BAF Weapons (RHS ammo compatibility)",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@3CB BAF Vehicles (RHS reskins)"
)

$ServerModList = @(
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@LAMBS_Danger.fsm",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@LAMBS_RPG",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@LAMBS_RPG_RHS",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@LAMBS_Suppression",
    "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\!Workshop\@LAMBS_Turrets"
)

###################################################################################################
###################################################################################################

$decision = $Host.UI.PromptForChoice("Increment version and make PBO?", 'Are you sure you want to proceed?', @('&Yes', '&No'), 1)
if ($decision -eq 0) {
    # Automatic increment of mission version found in init.sqf, used to add to the exported PBO
    $InitSQF = Get-Content -Path (Join-Path -Path $ProjectRoot -ChildPath 'init.sqf') -Raw
    if ($InitSQF -match '###MISSION_VERSION\s(\d+\.\d+)') {
        $Version = [System.Version]($Matches.1)
        Write-Host "Current mission version: $Version"

        $NewVersion = [System.Version]"$($Version.Major).$($Version.Minor + 1)"
        Write-Host "New mission version: $NewVersion"

        $NewInitSQF = $InitSQF -replace '###MISSION_VERSION\s(\d+\.\d+)', "###MISSION_VERSION $NewVersion"
        try { [System.IO.File]::WriteAllLines((Join-Path -Path $ProjectRoot -ChildPath 'init.sqf'), $NewInitSQF) }
        catch { throw "Failed to overwrite init.sqf with version tag. You may need to close the file and re-run the build script." }
        Write-Host "Overwrote init.sqf with version tag successfully"

        $ExtensionsToCheck = @('.sqf', '.cpp', '.hpp', '.ext', '.sqs', '.txt', '.md')
        $allFilesToCheck = Get-ChildItem -Path $ProjectRoot -File -Recurse | Where-Object 'Extension' -in $ExtensionsToCheck

        foreach ($file in $allFilesToCheck) {
            $matches = $null
            $FileContents = Get-Content -Path $File.FullName -Raw

            if ($FileContents -match ([regex]::Escape($MissionName_withV) + "\d+\.\d+")) {

                $NewFileContents = $FileContents -replace ([regex]::Escape($MissionName_withV) + "\d+\.\d+"), ($MissionName_withV + $NewVersion)
                try { [System.IO.File]::WriteAllLines($File.FullName, $NewFileContents) }
                catch { throw "Failed to overwrite $($File.Name) with version tag. You may need to close the file and re-run the build script." }
                Write-Host "Overwrote $($File.Name) with version tag successfully"

            }
            else {
                Write-Verbose "$($File.Name) did not have a matched version. Skipping..."
            }
        }
    }
    else {
        Write-Warning "Version missing from init.sqf. For automatic version increments add a block comment somewhere in your init.sqf with a line exactly like so: '###MISSION_VERSION 0.1'"
    }

    Write-Host "Exporting current mission folder: '$MissionFolderName' to MPMissions path: '$OutputPath'"
    & $FileBank_EXE -dst $OutputPath $ProjectRoot

    # Get the pbo built with FileBank
    $ExportedPBO = Get-Item -Path (Join-Path -Path $OutputPath -ChildPath "$MissionFolderName.pbo")

    # insert (file name compatible) version to pbo before world
    # insert _mods_ as it will pretty much always do it anyway
    # e.g. 30_tour_power_surge.Enoch.pbo -> 30_tour_power_surge_mods_0_2.Enoch.pbo
    $PBO_withVersion = $ExportedPBO.Name.SubString(0, $ExportedPBO.Name.IndexOf('.')) + "_mods" + "_v$($NewVersion.ToString().Replace('.','_'))" + $ExportedPBO.Name.SubString($ExportedPBO.Name.IndexOf('.'))

    # rename PBO to include version
    $NewPBO = Rename-Item -Path $ExportedPBO.FullName -NewName $PBO_withVersion -Force -PassThru
}
else {
    Write-Host "Skipping version increment and PBO make"
}

$decision = $Host.UI.PromptForChoice("Upload PBO '$PBO_withVersion' to Tour ARMA 3 server $TourServer ?", 'Are you sure you want to proceed?', @('&Yes', '&No'), 1)
if ($decision -eq 0) {
    $TourServerIP = if ($null -eq $env:TOUR_SERVER_IP) {
        # Environment var for IP not set, prompt for response
        Read-Host "Enter Tour server IP e.g. 1.2.3.4"
    }
    else {
        Write-Host "Getting Tour server IP env:TOUR_SERVER_IP"
        $env:TOUR_SERVER_IP
    }
    $TourServerPort = if ($null -eq $env:TOUR_SERVER_PORT) {
        # Environment var for port not set, prompt for response
        Read-Host "Enter FTP port for Tour server e.g. 8821"
    }
    else {
        Write-Host "Getting FTP port from env:TOUR_SERVER_PORT"
        $env:TOUR_SERVER_PORT
    }
    $TourServer = "$($TourServerIP):$($TourServerPort)"
    $FTPUsername = if ($null -eq $env:TOUR_FTP_USERNAME) {
        # Environment var for username not set, prompt for response
        Read-Host "Paste FTP username for the server '$TourServer'"
    }
    else {
        Write-Host "Getting FTP username from env:TOUR_FTP_USERNAME"
        $env:TOUR_FTP_USERNAME
    }
    $FTPPassword = if ($null -eq $env:TOUR_FTP_PASSWORD) {
        # Environment var for password not set, prompt for response
        Read-Host "Paste FTP password for user '$FTPUsername'" -MaskInput
    }
    else {
        Write-Host "Getting FTP password from env:TOUR_FTP_PASSWORD"
        $env:TOUR_FTP_PASSWORD
    }

    # ensure powershell can use all the available TLS protocols (not just TLS1.0 or w.e)
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls13
    [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true } ;

    
    # create the FtpWebRequest and configure it
    # ensure full path is set including desired filename
    $ftp = [System.Net.FtpWebRequest]::Create("ftp://$TourServer/$($TourServerIP)_2302/mpmissions/$PBO_withVersion")
    $ftp = [System.Net.FtpWebRequest]$ftp
    $ftp.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
    $ftp.Credentials = new-object System.Net.NetworkCredential($FTPUsername, $FTPPassword)
    $ftp.UseBinary = $true
    $ftp.UsePassive = $true
    $ftp.EnableSsl = $true
    # read in the file to upload as a byte array
    $content = [System.IO.File]::ReadAllBytes($NewPBO.FullName)
    $ftp.ContentLength = $content.Length
    # get the request stream, and write the bytes into it
    $rs = $ftp.GetRequestStream()
    $rs.Write($content, 0, $content.Length)
    # be sure to clean up after ourselves
    $rs.Close()
    $rs.Dispose()
}
else {
    Write-Host 'Skipping FTP upload'
}

$decision = $Host.UI.PromptForChoice("Start local server", 'Do you want to start up a local dedicated server?', @('&Yes', '&No'), 1)
if ($decision -eq 0) {

    if ($null -eq $NewPBO) {
        Write-Host "NewPBO not found (didn't increment?) using last modified PBO in output folder for server config"
        $NewPBO = Get-ChildItem -Path $OutputPath -Filter '*.pbo' | sort-object -Property 'LastWriteTime' -Descending | Select-Object -First 1
    }
    else {
        Write-Host "Using new PBO with incremented version in server config."
    }

    $CurrCFG = Get-Content -Path $A3_Server_Config -Raw
    if ($CurrCFG -match 'template\s+=\s+(.*);') {
        $NewCFG = $CurrCFG -replace $Matches.1, $NewPBO.Basename

        try { [System.IO.File]::WriteAllLines($A3_Server_Config, $NewCFG) }
        catch { throw "Failed to overwrite server config with new PBO. You may need to close the file and re-run the build script." }
        Write-Host "Overwrote server config with version tag successfully"
    }
    
    & $A3_Server -config="$A3_Server_Config" -name=LocalDedicatedServer -mod="$($ClientModList -join ';')" -serverMod="$($ServerModList -join ';')"
}
else {
    Write-Host 'Skip starting dedicated server'
}