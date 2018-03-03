if(is3DEN) exitWith {};

_unit = _this select 0;

if (local _unit) then 
{
	_unit addEventHandler ["reloaded", {_this call goko_fnc_oreloadedfx}];
	_unit addEventHandler ["hit", {_this call goko_fnc_odmgwoundsys}];
	_unit addeventhandler ["fired", {_this call goko_fnc_osmokefx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_ofragfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_oexplosvfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_o_acem84}];
	_unit addeventhandler ["fired", {_this call goko_fnc_o_aceM14}];
};
