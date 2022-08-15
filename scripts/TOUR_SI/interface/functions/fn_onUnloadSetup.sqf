private 
[
	"_display", "_textHelp", "_buttonExecute", "_comboRoundsType", "_comboSliderAmount"
];

_display = findDisplay 121320;
_buttonExecute = _display displayCtrl 121322;
_textHelp = _display displayCtrl 121321;
_comboRoundsType = _display displayCtrl 121323;
_comboSliderAmount = _display displayCtrl 121324;

if (!isNil {TOUR_SI_core getVariable "TOUR_SI_inuse"}) then
{
	if !(TOUR_SI_core getVariable "TOUR_SI_inuse") then
	{	
		TOUR_SI_core setVariable ["TOUR_SI_inuse", nil, true];
	};
};

