private ["_display", "_message", "_comboplayer", "_index", "_number", "_text", "_combolives", "_slidertime", "_combotype"];
_display = findDisplay 201800;
_message = _display displayCtrl 201801;
_combolives = _display displayCtrl 201803;
_slidertime = _display displayCtrl 201804;
_combotype = _display displayCtrl 201805;
_buttoncommit = _display displayCtrl 201807;
_comboplayer = _this select 0;
_index = _this select 1;
_text = _comboplayer lbText _index;

_message ctrlSetStructuredText parseText format
["
<br/><br/><t size='1.25' font='puristaMedium'>Respawn Player</t><br/><br/>%1 will be respawned once you press the Respawn Player Button.
", _text];	

_buttoncommit ctrlSetStructuredText parseText format
["
Respawn Player
"];