private ["_display", "_message", "_combolives", "_index", "_number", "_text", "_comboplayer"];
_display = findDisplay 201800;
_message = _display displayCtrl 201801;
_buttoncommit = _display displayCtrl 201807;
_comboplayer = _display displayCtrl 201809;
_combolives = _this select 0;
_index = _this select 1;
_text = _combolives lbText _index;

_message ctrlSetStructuredText parseText format
["
<br/><br/><t size='1.25' font='puristaMedium'>Lives Available: %1</t><br/><br/>This is the amount of lives a side will have, once the changes are commited.
", _text];
_buttoncommit ctrlSetStructuredText parseText format
["
Commit Changes
"];