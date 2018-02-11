if(is3DEN) exitWith {};

_unit = _this select 0;

if (local _unit) then {
	_unit addEventHandler ["hit", {_this call goko_fnc_Indmgwoundsys}];
	_unit addEventHandler ["reloaded", {_this call goko_fnc_Inreloadedfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_Insmokefx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_Infragfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_Inexplsvfx}];
};