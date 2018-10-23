if(is3DEN) exitWith {};

_unit = _this select 0;

if (local _unit) then 
{
	_unit addEventHandler ["reloaded", {_this call gokoVO_fnc_reloadingBlufor}];
	_unit addEventHandler ["hit", {_this call gokoVO_fnc_woundedBlufor}];
	_unit addeventhandler ["fired", {_this call gokoVO_fnc_throwablesBlufor}];
	
	if (isClass(configFile >> "CfgPatches" >> "ace_main")) then
	{
		_unit addEventhandler ["killed", {_this call gokoVO_fnc_killedBluforACE3}];
	} 
	else
	{
		_unit addEventhandler ["Killed", {_this call gokoVO_fnc_killedBlufor}];
	};
};
