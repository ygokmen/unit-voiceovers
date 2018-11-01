/*
	goko unit voice-overs addon reloadedEH function
	author: gökmen
	website: https://github.com/the0utsider
	description: detects full reload with emptied clip, spawns a custom 'reloading' EH. 
	code performance is top notch but, there is a disadvantage: it won't trigger first time 
*/
params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];

if (isPlayer _unit && !goko_vo_client_enabled) exitWith{};

private _isAlone = count (_unit nearEntities [["soldiergb"], 50]) == 1; 
if (_isAlone || _weapon != _muzzle || !isNil "ace_arsenal_camera" || !isNil "RSCDisplayArsenal") exitWith {}; 
if !(isNil (_unit getVariable "Achilles_var_suppressiveFire_ready") && (_unit getVariable "Achilles_var_suppressiveFire_ready")) exitWith {}; 

private _bOutofAmmo = getArray(configfile >> "CfgWeapons" >> _muzzle >> "magazines") arrayIntersect magazines _unit isEqualTo [];
if (_bOutofAmmo) exitWith {[_unit] call gokoVO_fnc_ammoLowBlufor};

_null = _this spawn {
	_actor = _this#0;
	_muzzle = _this#2;
	_newMagID = _this#3#2 - 1e+007;
	_oldMagID = _this#4#2 - 1e+007;
	_saveCycles = 1.0;
	if (isPlayer _actor) then {_saveCycles = 0.2};
	_getMuzzle = if (!alive _actor) then {""} else {currentMuzzle _actor};

	while {alive _actor && _getMuzzle == _muzzle} do {
		if (inputAction "reloadMagazine" > 0 && _actor ammo _muzzle == 0 ) exitWith {};
		if (!isplayer _actor && _actor ammo _muzzle == 0) exitWith {};
		sleep _saveCycles;
	};
	if (!alive _actor) exitwith{};

	private _getMagID = if (currentMagazineDetail _actor isEqualTo "") then {0} else  
	{(parseNumber (currentMagazineDetail _actor splitString "[]:/" select 4)) - 1e+007};  
	if (_getMagID != _newMagID) exitWith {};
	
	private _reloadingSample = selectrandom ["inrel01", "inrel02", "inrel03", "inrel04", 
	"inrel05", "inrel06", "inrel07", "inrel08",	"inrel09", "inrel10", "inrel11", 
	"inrel12", "inrel13", "inrel14", "inrel15", "inrel16", "inrel17", "inrel18", 
	"inrel19", "inrel20", "inrel21", "inrel22", "inrel23", "inrel24", "inrel25", 
	"inrel26", "inrel27", "inrel28", "inrel29", "inrel30", "inrel31", "inrel32", 
	"inrel33", "inrel34", "inrel35", "inrel36", "inrel37", "inrel38","inrel39"];

	[_actor, _reloadingSample] call gokovo_fnc_globalSay3d;
	
	private _getFriends = (_actor nearEntities [["soldiergb"], 50]) - [_actor];
	if (isNil{_getFriends #0}) exitwith {};
	private _yanci = selectrandom _getFriends;
	
	private _friendlySupportingSample = selectRandom ["Incover01", "Incover02", "Incover03", 
	"Incover04", "Incover05", "Incover06", "Incover07", "Incover08", "Incover09", 
	"Incover10", "Incover11", "Incover12", "Incover13", "Incover14", "Incover15", 
	"Incover16", "Incover17", "Incover18", "Incover19", "Incover20", "Incover21", "Incover22"];
	
	waitUntil {	
		sleep (0.5 + round(random 5));
		true 
	};
	
	[_yanci, _friendlySupportingSample] call gokovo_fnc_globalSay3d;
};
