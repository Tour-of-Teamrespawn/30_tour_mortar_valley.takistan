_unit = _this;

removeAllWeapons _unit;
removebackpack _unit;
removeallitems _unit;
removeUniform _unit;
removeHeadgear _unit;
removeVest _unit;
removeAllAssignedItems _unit;

_fn = compile preprocessfilelinenumbers format ["scripts\loadouts\%1.sqf", (typeOf _unit)];
_array = call _fn;

if ((_array select 3) != "") then
{
	_unit addUniform (_array select 3);
};

if ((_array select 4) != "") then
{
	_unit addheadGear (_array select 4);
};

if ((_array select 5) != "") then
{
	_unit addVest (_array select 5);
};

if ((_array select 6) != "") then
{
	_unit addBackpack (_array select 6);
};

{
	_unit addItem _x;
	_unit assignItem _x;
}forEach (_array select 10);

{
	_unit additemToUniform _x;
}forEach (_array select 7);

{
	_unit additemToVest _x;
}forEach (_array select 8);

{
	_unit additemToBackpack _x;
}forEach (_array select 9);

if ((_array select 0) != "") then
{
	_unit addWeapon (_array select 0);
};

if ((_array select 1) != "") then
{
	_unit addWeapon (_array select 1);
};

if ((_array select 2) != "") then
{
	_unit addWeapon (_array select 2);
};

{
	_unit addHandgunItem _x;
}forEach (_array select 11);

{
	_unit addPrimaryWeaponItem _x;
}forEach (_array select 12);

{
	_unit addSecondaryWeaponItem  _x;
}forEach (_array select 13);

_unit addweapon (_array select 14);

reload _unit;

TOUR_radioSetupStart = true;