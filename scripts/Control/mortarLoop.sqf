Private ["_magsEnd"];

while {{canFire _x}count TOUR_mortars > 0} do
{
	{
		if (canfire _x) then
		{
			_targets = [TOUR_mTarget_1, TOUR_mTarget_2, TOUR_mTarget_3, TOUR_mTarget_4];
			while {count _targets > 0} do
			{
				_target = _targets call BIS_fnc_selectRandom;
				_targets = _targets - [_target];
				_magsStart = str (magazinesAmmoFull _x);
				_magsEnd = str (magazinesAmmoFull _x);
				if (canfire _x) then
				{
					_x doArtilleryFire [getPosATL _target, "rhs_mag_3vo18_10", 1];
					sleep 5;
					_magsEnd = str (magazinesAmmoFull _x);
				};
				if (_magsEnd != _magsStart) exitWith
				{
					_x setvehicleAmmo 1;
				};
			};
		};
		sleep 20 + (random 10);
	}forEach TOUR_mortars;
};