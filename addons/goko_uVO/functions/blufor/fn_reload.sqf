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
_findFriendlies = _unit nearEntities [["soldierwb"], 50]; 
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
			"brel01", "brel02", "brel03", "brel04", "brel05", "brel06", "brel07", "brel08", "brel09", "brel10",	"brel11",
			"brel12", "brel13",	"brel14", "brel15", "brel16", "brel17",	"brel18", "brel19", "brel20", "brel21",	"brel22",
			"brel23", "brel24",	"brel25", "brel26",	"brel27", "brel28",	"brel29", "brel30",	"brel31"
		];
		[_this, _reloadingSample] call gokovo_fnc_globalSay3d;
	
		waitUntil {	sleep 2 + random 2;	true };
		_findSupport = _this nearEntities [["soldierwb"], 30]; 
		_findSupport deleteat 0; 
		if (isnil {_findSupport # 0}) exitwith {};
		_support = selectrandom _findSupport;
		_friendlySupportingSample = selectRandom [
			"bcover01", "bcover02", "bcover03", "bcover04", "bcover05", "bcover06", "bcover07", "bcover08", 
			"bcover09", "bcover10", "bcover11", "bcover12", "bcover13", "bcover14", "bcover15", "bcover16", "bcover17"
		];
		[_support, _friendlySupportingSample] call gokovo_fnc_globalSay3d;
	};
} 
else
{
	if (currentweapon _unit != secondaryweapon _unit) then
	{
		_unitAmmoLowSample = selectRandom ["blowammo01", "blowammo02", "blowammo03", "blowammo04", "blowammo05", "blowammo06"];
		[_unit, _unitAmmoLowSample] call gokovo_fnc_globalSay3d;
	} 
	else
	{
		_support = selectrandom _findFriendlies;
		_friendlyCoveringSample = selectRandom [
			"bcover01", "bcover02", "bcover03", "bcover04", "bcover10", "bcover11", "bcover12", "bcover13"
		];
		[_support, _friendlyCoveringSample] call gokovo_fnc_globalSay3d;
	};
};
