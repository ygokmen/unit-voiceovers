if(is3DEN) exitWith {};

_unit = _this select 0;

if (local _unit) then 
{
	_unit addEventHandler ["hit", {_this call goko_fnc_INSdmgwoundsys}];
	_unit addEventHandler ["reloaded", {_this call goko_fnc_INSreloadedfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_INSsmokefx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_INSfragfx}];
	_unit addeventhandler ["fired", {_this call goko_fnc_INSexplosvfx}];
	
	if (isClass(configFile >> "CfgPatches" >> "ace_main")) then 
	{
		_unit addeventhandler ["fired", {_this call goko_fnc_INS_acem84}];
		_unit addeventhandler ["fired", {_this call goko_fnc_INS_aceM14}];
		_unit addeventhandler ["killed", {_this call goko_fnc_INSdeath_ace3}];
	} else
	{
		_unit AddEventhandler ["killed", {_this call goko_fnc_INSdeath}];
	};
};
