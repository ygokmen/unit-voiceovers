/*
	goko unit voice-overs addon reloadedEH function
	author: gökmen
	website: https://github.com/the0utsider
	description: detects full reload with emptied clip, spawns a custom 'reloading' EH. 
	code performance is top notch but, there is a disadvantage: it won't trigger first time 
*/
params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];

_isAlone = count (_unit nearEntities [["soldierwb"], 50]) == 1; 
if (_isAlone || _weapon != _muzzle || !isnil "ace_arsenal_camera" || !isnil "RSCDisplayArsenal") exitWith {}; 
if !(isNil (_unit getVariable "Achilles_var_suppressiveFire_ready") && (_unit getVariable "Achilles_var_suppressiveFire_ready")) exitWith {}; 

_countMagz = {
_x == currentMagazine _unit
}count (magazines _unit);
if (_countMagz < 1) exitWith {[_unit] call gokoVO_fnc_ammoLowBlufor};

_null = _this spawn {
	_actor = _this#0;
	_muzzle = _this#2;
	_newMagID = _this#3#2 - 1e+007;
	_oldMagID = _this#4#2 - 1e+007;
	_saveCycles = 1.0;
	if (isPlayer _actor) then {_saveCycles = 0.2};
	waitUntil {
		sleep _saveCycles;
		!alive _actor;
		if (inputaction "reloadmagazine" > 0 && ((_actor ammo _muzzle) == 0 || _muzzle != currentMuzzle _actor)) exitWith {true};
		if (!isplayer _actor && (_actor ammo _muzzle) == 0 ) exitWith {true};
	};
	if (!alive _actor) exitwith{};
	
	_getMagID = if (currentMagazineDetail _actor isEqualTo "") then {0} else  
	{(parseNumber (currentMagazineDetail _actor splitString "[]:/" select 4)) - 1e+007};  
	if (_getMagID != _newMagID) exitWith {};
	
<<<<<<< Updated upstream
	_reloadingSample =  selectrandom [
		"brel01", "brel02", "brel03", "brel04", "brel05", "brel06", "brel07", "brel08", "brel09", "brel10",	"brel11",
		"brel12", "brel13",	"brel14", "brel15", "brel16", "brel17",	"brel18", "brel19", "brel20", "brel21",	"brel22",
		"brel23", "brel24",	"brel25", "brel26",	"brel27", "brel28",	"brel29", "brel30",	"brel31"
	];
=======
	_reloadingSample = selectrandom ["brel01", "brel02", "brel03", 
	"brel04", "brel05", "brel06", "brel07", "brel08", "brel09", "brel10", 
	"brel11", "brel12", "brel13", "brel14", "brel15", "brel16", "brel17", 
	"brel18", "brel19", "brel20", "brel21", "brel22", "brel23", "brel24", 
	"brel25", "brel26", "brel27", "brel28", "brel29", "brel30", "brel31"]; 
>>>>>>> Stashed changes
	[_actor, _reloadingSample] call gokovo_fnc_globalSay3d;
	
	_getFriends = (_actor nearEntities [["soldierwb"], 50]) - [_actor];
	if (isnil{_getFriends #0}) exitwith {};
	_yanci = selectrandom _getFriends;
	_friendlySupportingSample = selectRandom ["bcover01", "bcover02", "bcover03", 
	"bcover04", "bcover05", "bcover06", "bcover07", "bcover08", "bcover09", "bcover10", 
	"bcover11", "bcover12", "bcover13", "bcover14", "bcover15", "bcover16", "bcover17"];
	waitUntil {
		sleep 2 + random 3;
		true 
	};
	[_yanci, _friendlySupportingSample] call gokovo_fnc_globalSay3d;
};
