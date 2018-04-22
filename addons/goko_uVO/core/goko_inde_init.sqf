if(is3DEN) exitWith {};

_unit = _this select 0;

if (local _unit) then 
{
	_unit addEventHandler ["hit", {_this call goko_fnc_Indmgwoundsys}];
	_unit addEventHandler ["reloaded", {_this call goko_fnc_Inreloadedfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_Insmokefx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_Infragfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_Inexplosvfx}];
	
	if (isClass(configFile >> "CfgPatches" >> "ace_main")) then 
	{
		_unit addeventhandler ["fired", {_this call goko_fnc_in_acem84}];
		_unit addeventhandler ["fired", {_this call goko_fnc_in_aceM14}];
		_unit addeventhandler ["killed", {_this call goko_fnc_Indeath_ace3}];
	} else
	{
		_unit AddEventhandler ["killed", {_this call goko_fnc_Indeath}];
	};
};
