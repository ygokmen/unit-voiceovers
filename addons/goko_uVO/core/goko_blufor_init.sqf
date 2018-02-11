if(is3DEN) exitWith {};

_unit = _this select 0;

if (local _unit) then {
	_unit addEventHandler ["hit", {_this call goko_fnc_bdmgwoundsys}];
	_unit addEventHandler ["reloaded", {_this call goko_fnc_breloadedfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_bsmokefx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_bfragfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_bexplsvfx}];
};