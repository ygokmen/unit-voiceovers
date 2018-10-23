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
_findFriendlies = _unit nearEntities [["soldiereb"], 50]; 
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
			"orel01", "orel02", "orel03", "orel04", "orel05", "orel06",
			"orel07", "orel08", "orel09", "orel10", "orel11", "orel12",
			"orel13", "orel14", "orel15", "orel16", "orel17", "orel18",
			"orel19", "orel20", "orel21", "orel22", "orel23", "orel24",
			"orel25", "orel26", "orel27", "orel28", "orel29","orel30"
		];
		[_this, _reloadingSample] call gokovo_fnc_globalSay3d;
	
		waitUntil {	sleep 2 + random 2;	true };
		_findSupport = _this nearEntities [["soldiereb"], 30]; 
		_findSupport deleteat 0; 
		if (isnil {_findSupport # 0}) exitwith {};
		_support = selectrandom _findSupport;
		_friendlySupportingSample = selectRandom [
			"opcover01", "opcover02", "opcover03", "opcover04", 
			"opcover05", "opcover06", "opcover07", "opcover08", 
			"opcover09", "opcover10", "opcover11", "opcover12", 
			"opcover13", "opcover14", "opcover15", "opcover16", 
			"opcover17", "opcover18"
		];
		[_support, _friendlySupportingSample] call gokovo_fnc_globalSay3d;
	};
} 
else
{
	if (currentweapon _unit != secondaryweapon _unit) then
	{
		_unitAmmoLowSample = selectRandom [ "olowammo01", "olowammo02", "olowammo03", "olowammo04",	"olowammo05" ];
		[_unit, _unitAmmoLowSample] call gokovo_fnc_globalSay3d;
	} 
	else
	{
		_support = selectrandom _findFriendlies;
		_friendlyCoveringSample = selectRandom [
			"opcover01", "opcover02", "opcover03", "opcover14", 
			"opcover15", "opcover16", "opcover17", "opcover18"
		];
		[_support, _friendlyCoveringSample] call gokovo_fnc_globalSay3d;
	};
};
