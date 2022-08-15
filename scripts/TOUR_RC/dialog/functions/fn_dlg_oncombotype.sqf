private ["_display", "_message", "_combotype", "_index", "_text", "_info", "_comboplayer"];
_display = findDisplay 201800;
_message = _display displayCtrl 201801;
_slidertime = _display displayCtrl 201804;
_buttoncommit = _display displayCtrl 201807;
_comboplayer = _display displayCtrl 201809;
_combotype = _this select 0;
_index = _this select 1;
_text = _combotype lbText _index;

_info = switch (toLower _text) do
{
	case "do not clear":
	{
		"<br/><br/><t size='1.25' font='puristaMedium'>Do Not Clear UIDs</t><br/><br/>Do not clear the list of already dead players. With this they cannot respawn even when the parameters are reset."
	};
	case "clear":
	{
		"<br/><br/><t size='1.25' font='puristaMedium'>Clear UIDs</t><br/><br/>Clear the list of already dead players. With this all dead players will respawn even when the parameters are reset."
	};
};
_message ctrlSetStructuredText parseText format
["
%1
", _info];
_buttoncommit ctrlSetStructuredText parseText format
["
Commit Changes
"];