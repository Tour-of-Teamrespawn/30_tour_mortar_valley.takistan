private ["_array", "_strNew", "_posS", "_posA", "_posX", "_posY"];

_array =_this;

_posS = str (_array select 0);
_posA = toArray _posS;
_posX = [];
for "_p" from 0 to 2 do
{
	_posX set [count _posX, _posA select _p];
};

_posS = str (_array select 1);
_posA = toArray _posS;
_posY = [];
for "_p" from 0 to 2 do
{
	_posY set [count _posY, _posA select _p];
};

_strNew = "[" + (toString _posX) + "," + (toString _posY) + "]";

_strNew