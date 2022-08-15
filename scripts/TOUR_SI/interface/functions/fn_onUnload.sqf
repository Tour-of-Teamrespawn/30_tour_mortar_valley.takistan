private 
[
	"_index", "_display", "_map", "_textHelp", "_buttonExecute", "_comboRoundsType", "_comboSliderAmount", "_comboSliderRadius", "_comboSliderInterval", "_text1", "_text2", "_text3", "_text4", "_end", "_markers", "_mkrnumber"
];

_display = findDisplay 121220;

_textHelp = _display displayCtrl 121221;
_textSupportType = _display displayCtrl 121222;
_textUnit = _display displayCtrl 121223;
_textType = _display displayCtrl 121224;
_textAmountHeight = _display displayCtrl 121225;
_textRadius = _display displayCtrl 121226;
_textIntSpeed = _display displayCtrl 121227;
_textBehaviour = _display displayCtrl 121228;

_map = _display displayCtrl 121230;
_buttonExecute = _display displayCtrl 121231;
_buttonEnd = _display displayCtrl 121232;
_buttonInfo = _display displayCtrl 121233;
_buttonConfirm = _display displayCtrl 121234;
_buttonReject = _display displayCtrl 121235;

_comboSupport = _display displayCtrl 121240;
_comboUnit = _display displayCtrl 121241;
_comboType = _display displayCtrl 121242;
_comboBehaviour = _display displayCtrl 121246;

_sliderAmountHeight = _display displayCtrl 121243;
_SliderRadius = _display displayCtrl 121244;
_SliderIntSpeed = _display displayCtrl 121245;

_commandType = (_comboType lbText (lbCurSel _comboType));
_supportType = _comboSupport lbText (lbCurSel _comboSupport);

TOUR_SI_pressed_once = nil;
TOUR_SI_pressed_once_end = nil;

_mkrnumber = 1;
while {!(str (getMarkerPos format ["TOUR_SI_marker_%1", _mkrnumber]) == "[0,0,0]")} do
{
	deleteMarkerLocal format ["TOUR_SI_marker_%1", _mkrnumber];
	_mkrnumber = _mkrnumber + 1;
};
