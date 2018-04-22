if(is3DEN) exitWith {};

_unit = _this select 0;

if (local _unit) then 
{
	_unit addEventHandler ["hit", {_this call goko_fnc_bdmgwoundsys}];
	_unit addEventHandler ["reloaded", {_this call goko_fnc_breloadedfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_bsmokefx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_bfragfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_bexplosvfx}];
	
	if (isClass(configFile >> "CfgPatches" >> "ace_main")) then 
	{
		_unit addeventhandler ["killed", {_this call goko_fnc_bdeath_ace3}];
		_unit addeventhandler ["fired", {_this call goko_fnc_b_acem84}];
		_unit addeventhandler ["fired", {_this call goko_fnc_b_aceM14}];
	} else
	{
		_unit addeventhandler ["killed", {_this call goko_fnc_bdeath}];
	};
};
