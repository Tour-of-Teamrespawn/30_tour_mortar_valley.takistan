private ["_veh", "_fuel", "_damage", "_add", "_base"];

_veh = _this select 0;
_base = _this select 1;
_add = 0.01;
_fuel = fuel _veh;
_veh setVariable ["TOUR_SI_unitStatus", "servicing", true];
