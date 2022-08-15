private ["_display", "_message", "_slidertime", "_position", "_comboplayer"];
_display = findDisplay 201800;
_message = _display displayCtrl 201801;
_buttoncommit = _display displayCtrl 201807;
_comboplayer = _display displayCtrl 201809;
_slidertime = _display displayCtrl 201804;
_position = _this select 1;	
_message ctrlSetStructuredText parseText format
["
<br/><br/><t size='1.25' font='puristaMedium'>Respawn Delay: %1</t><br/><br/>This number is the time in seconds a player must wait to respawn, once the changes are commited.
", (round _position)];
_buttoncommit ctrlSetStructuredText parseText format
["
Commit Changes
"];