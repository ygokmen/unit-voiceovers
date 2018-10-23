/*
	goko unit voice-overs addon reloadedEH function
	author: gökmen
	website: https://github.com/the0utsider
	description: written to detect AI reloads, a custom 'reloading' EH
*/
params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];
//TODO:write simpler function for player
if (_weapon != _muzzle || !isnil "ace_arsenal_camera" || !isnil "RSCDisplayArsenal") exitWith {}; 
if !(isNil (_unit getVariable "Achilles_var_suppressiveFire_ready") && (_unit getVariable "Achilles_var_suppressiveFire_ready")) exitWith {}; 
//most of the checks and loop is required for AI units
_findFriendlies = _unit nearEntities [["soldiergb"], 50]; 
_findFriendlies deleteat (_findFriendlies find _unit);
if (isnil {_findFriendlies # 0}) exitwith {};

private _countMagz = {
_x == currentMagazine _unit
}count (magazines _unit);

if (_countMagz > 0) then 
{
	_unit spawn {
		private _storeMagID = if (currentMagazineDetail _this isEqualTo "") then {""} else  
		{currentMagazineDetail _this splitString "[]:/" select 4};  
		_chamber = 999;
	
		waitUntil {
			sleep 1;
			_chamber = _this ammo (currentMuzzle _this);
			private _checkMagIDs = if (currentMagazineDetail _this isEqualTo "") then {""} else  
			{currentMagazineDetail _this splitString "[]:/" select 4};
			if (inputaction "reloadmagazine" > 0 || _chamber == 0 || _storeMagID != _checkMagIDs || !alive _this) exitWith {true};
			false //<-- boolean at the end of the scope
		};
		if (!alive _this) exitWith {};

		_checkMagIDs = if (currentMagazineDetail _this isEqualTo "") then {""} else  
		{currentMagazineDetail _this splitString "[]:/" select 4};  
		if (_storeMagID != _checkMagIDs) exitWith {};
		
		_reloadingSample =  selectrandom [
			"inrel01", "inrel02", "inrel03", "inrel04",	"inrel05", "inrel06", "inrel07", "inrel08",	"inrel09", "inrel10",
			"inrel11", "inrel12", "inrel13", "inrel14", "inrel15", "inrel16", "inrel17", "inrel18", "inrel19", "inrel20",
			"inrel21", "inrel22", "inrel23", "inrel24", "inrel25", "inrel26", "inrel27", "inrel28",	"inrel29", "inrel30",
			"inrel31", "inrel32", "inrel33", "inrel34", "inrel35", "inrel36", "inrel37", "inrel38",	"inrel39"
		];
		[_this, _reloadingSample] call gokovo_fnc_globalSay3d;
	
		waitUntil {	sleep 2 + random 2;	true };
		_findSupport = _this nearEntities [["soldiergb"], 30]; 
		_findSupport deleteat 0; 
		if (isnil {_findSupport # 0}) exitwith {};
		_support = selectrandom _findSupport;
		_friendlySupportingSample = selectRandom [
			"Incover01", "Incover02", "Incover03", "Incover04", "Incover05", "Incover06", "Incover07", "Incover08", 
			"Incover09", "Incover10", "Incover11", "Incover12", "Incover13", "Incover14", "Incover15", "Incover16", 
			"Incover17", "Incover18", "Incover19", "Incover20", "Incover21", "Incover22"
		];
		[_support, _friendlySupportingSample] call gokovo_fnc_globalSay3d;
	};
} 
else
{
	if (currentweapon _unit != secondaryweapon _unit) then
	{
		_unitAmmoLowSample = selectRandom ["inlowammo01", "inlowammo02", "inlowammo03", "inlowammo04", "inlowammo05", "inlowammo06"];
		[_unit, _unitAmmoLowSample] call gokovo_fnc_globalSay3d;
	} 
	else
	{
		_support = selectrandom _findFriendlies;
		_friendlyCoveringSample = selectRandom [
				"Incover01", "Incover02", "Incover03", "Incover04", "Incover05", "Incover06", "Incover07", 
				"Incover08", "Incover09", "Incover10", "Incover12", "Incover14"
		];
		[_support, _friendlyCoveringSample] call gokovo_fnc_globalSay3d;
	};
};
