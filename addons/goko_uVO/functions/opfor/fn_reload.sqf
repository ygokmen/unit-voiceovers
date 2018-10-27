/*
	goko unit voice-overs addon reloadedEH function
	author: gökmen
	website: https://github.com/the0utsider
	description: detects full reload with emptied clip, spawns a custom 'reloading' EH. 
	code performance is top notch but, there is a disadvantage: it won't trigger first time 
*/
params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];

_isAlone = count (_unit nearEntities [["soldiereb"], 50]) == 1; 
if (_isAlone || _weapon != _muzzle || !isnil "ace_arsenal_camera" || !isnil "RSCDisplayArsenal") exitWith {}; 
if !(isNil (_unit getVariable "Achilles_var_suppressiveFire_ready") && (_unit getVariable "Achilles_var_suppressiveFire_ready")) exitWith {}; 

_countMagz = {
_x == currentMagazine _unit
}count (magazines _unit);
if (_countMagz < 1) exitWith {[_unit] call gokoVO_fnc_ammoLowOpfor};

_null = _this spawn {
	_actor = _this#0;
	_muzzle = _this#2;
	_newMagID = _this#3#2 - 1e+007;
	_oldMagID = _this#4#2 - 1e+007;
	_saveCycles = 1.0;
	if (isPlayer _actor) then {_saveCycles = 0.2};

	waitUntil {
		if ((inputaction "reloadmagazine" > 0) && (_actor ammo _muzzle == 0 || _muzzle != currentMuzzle _actor)) exitWith {true};
		sleep _saveCycles;
		((!isplayer _actor && _actor ammo _muzzle == 0) || isNull _actor || !alive _actor);
	};
	if (!alive _actor) exitwith{};

	_getMagID = if (currentMagazineDetail _actor isEqualTo "") then {0} else  
	{(parseNumber (currentMagazineDetail _actor splitString "[]:/" select 4)) - 1e+007};  
	if (_getMagID != _newMagID) exitWith {};
	
	_reloadingSample = selectrandom ["orel01", "orel02", "orel03", 
	"orel04", "orel05", "orel06", "orel07", "orel08", "orel09", "orel10", 
	"orel11", "orel12", "orel13", "orel14", "orel15", "orel16", "orel17", 
	"orel18", "orel19", "orel20", "orel21", "orel22", "orel23", "orel24", 
	"orel25", "orel26", "orel27", "orel28", "orel29","orel30"];
	
	[_actor, _reloadingSample] call gokovo_fnc_globalSay3d;
	
	_getFriends = (_actor nearEntities [["soldiereb"], 50]) - [_actor];
	if (isnil{_getFriends #0}) exitwith {};
	_yanci = selectrandom _getFriends;
	
	_friendlySupportingSample = selectRandom ["opcover01", "opcover02", "opcover03", "opcover04", 
	"opcover05", "opcover06", "opcover07", "opcover08", "opcover09", "opcover10", "opcover11", 
	"opcover12", "opcover13", "opcover14", "opcover15", "opcover16", "opcover17", "opcover18"];
	
	waitUntil {	
		sleep 2 + random 3;
		true 
	};
	
	[_yanci, _friendlySupportingSample] call gokovo_fnc_globalSay3d;
};
