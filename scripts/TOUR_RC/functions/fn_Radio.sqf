for "_i" from 1 to 15 do
{
	if (_i != ((missionNameSpace getVariable "TOUR_RC_specRadio") + 5)) then
	{
		if ((isClass(configFile>>"CfgPatches">>"TOUR_adminConsole"))or(serverCommandAvailable "#kick")) then
		{
			if (_i >= 3) then
			{
				_i enableChannel [false, false];
			};
		}else
		{
			_i enableChannel [false, false];
		};
	};
};

(missionNameSpace getVariable "TOUR_RC_specRadio") radioChannelAdd [player];
sleep 1;
setCurrentChannel ((missionNameSpace getVariable "TOUR_RC_specRadio") + 5);

waitUntil {alive player};

for "_i" from 1 to 15 do
{
	if (_i == ((missionNameSpace getVariable "TOUR_RC_specRadio") + 5)) then
	{
		_i radioChannelRemove [player];
	}else
	{
		_i enableChannel [true, true];
	};
};

setCurrentChannel 5;
(missionNameSpace getVariable "TOUR_RC_specRadio") radioChannelRemove [player];