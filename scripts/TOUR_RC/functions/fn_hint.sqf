//create a structured text hint

private ["_heading", "_headingText", "_hintText", "_type"];

_type = _this select 0;
_hintText =  _this select 1;

_headingText = switch (toLower _type) do
{
	case "error": {"<t size='1.25' font='puristaMedium' color='#ff0000' align='center' valign='top'>ERROR!</t>"};
	case "warning": {"<t size='1' font='puristaMedium' align='center' color='#ffa500' valign='top'>WARNING!</t>"};
	case "hint": {"<t size='1.25' font='puristaMedium' align='center' color='#3cb371' valign='top'>INFO!</t>"};
	default {format ["<t size='1.25' font='puristaMedium' align='center' color='#0080ff' valign='top'>%1</t>", _type]};
};

_textHint = parseText format
["
	<t size='1.25' font='puristaMedium' color='#0080ff' align='center' valign='top'>RESPAWN CONTROL:</t>
	<br/>
	<br/>
	%1
	<br/>
	<br/>
	<t size='0.85' font='TahomaB' color='#D0D0D0' align='left' valign='top'>%2</t>
",_headingText, _hintText];

hint _textHint;