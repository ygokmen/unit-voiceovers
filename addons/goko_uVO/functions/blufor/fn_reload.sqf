/*
	goko unit voice-overs addon reloadedEH function
	author: gökmen
	website: https://github.com/the0utsider
	description: detects full reload with emptied clip, spawns a custom 'reloading' EH. 
	code performance is top notch but, there is a disadvantage: it won't trigger first time 
*/
params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];

if (isPlayer _unit && !goko_vo_client_enabled) exitWith{};

private _isAlone = count (_unit nearEntities [["soldierwb"], 50]) == 1; 
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
	
	private _reloadingSample = selectrandom ["brel01", "brel02", "brel03", 
	"brel04", "brel05", "brel06", "brel07", "brel08", "brel09", "brel10", 
	"brel11", "brel12", "brel13", "brel14", "brel15", "brel16", "brel17", 
	"brel18", "brel19", "brel20", "brel21", "brel22", "brel23", "brel24", 
	"brel25", "brel26", "brel27", "brel28", "brel29", "brel30", "brel31"]; 

	[_actor, _reloadingSample] call gokovo_fnc_globalSay3d;
	
	private _getFriends = (_actor nearEntities [["soldierwb"], 50]) - [_actor];
	if (isNil{_getFriends #0}) exitwith {};
	private _yanci = selectrandom _getFriends;
	
	private _friendlySupportingSample = selectRandom ["bcover01", "bcover02", "bcover03", 
	"bcover04", "bcover05", "bcover06", "bcover07", "bcover08", "bcover09", "bcover10", 
	"bcover11", "bcover12", "bcover13", "bcover14", "bcover15", "bcover16", "bcover17"];
	
	waitUntil {
		sleep (0.5 + round(random 5));
		true 
	};
	
	[_yanci, _friendlySupportingSample] call gokovo_fnc_globalSay3d;
};
