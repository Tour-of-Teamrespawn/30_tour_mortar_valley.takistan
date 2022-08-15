_display = findDisplay 201800;
_slothelp = _display displayCtrl 201802;
_buttonslots = _display displayCtrl 201808;

if (count ((TOUR_RC_fncmodule getVariable "TOUR_RC_array") select 1) > 0) then
{
	//unlocking slots
	_slothelp ctrlSetText "Slots Unlocked";
	_buttonslots ctrlSetText "Lock Slots";
	missionNameSpace setVariable ["TOUR_RC_Locked", false, true];
}else
{
	//locking slots
	_slothelp ctrlSetText "Slots Locked";
	_buttonslots ctrlSetText "Unlock Slots";
	missionNameSpace setVariable ["TOUR_RC_Locked", true, true];
};