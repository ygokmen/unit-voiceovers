/*
	goko unit voice-overs addon killedEH main function /w ACE3 compatibility
	author: gökmen
	website: https://github.com/the0utsider
	description: methods trigger on unit killed
*/
params ["_unit"];

/*	required for ACE3 compatibility. */
private ["_instigator"];
_instigator = _unit getVariable "ace_medical_lastDamageSource";

#include <deathSounds_array.sqf>
/*  play sound sample on death */
playsound3d [format ["%1",_deathSound], _unit, false, getPosASL _unit, goko_vo_deathshouts_volume, 1, goko_vo_deathshouts_diameter];

/*  search for friendly unit around 50meter radius. */
_searchFriendly = (_unit nearEntities [["SoldierWB"], 50]) - [_unit];

/*  if unit found, plays 'man down!' sound. 'spawn' is necessary to add delay. */
if !(isnil {_searchFriendly #0}) then
{
	_foundFriendly = selectRandom _searchFriendly;
	if (isPlayer _foundFriendly && !goko_vo_client_enabled) exitWith{};
	_foundFriendly spawn {
		_manDown = selectRandom ["bsubdown01", "bsubdown02", "bsubdown03", "bsubdown04", "bsubdown05", 
		"bsubdown06", "bsubdown07", "bsubdown08", "bsubdown09", "bsubdown10", "bsubdown11", "bsubdown12", 
		"bsubdown13", "bsubdown14", "bsubdown15", "bsubdown16", "bsubdown17", "bsubdown18", "bsubdown19", 
		"bsubdown20", "bsubdown21", "bsubdown22", "bsubdown23", "bsubdown24", "bsubdown25", "bsubdown26", 
		"bsubdown27", "bsubdown28", "bsubdown29", "bsubdown30", "bsubdown31", "bsubdown32", "bsubdown33", 
		"bsubdown34", "bsubdown35", "bsubdown36", "bsubdown37", "bsubdown38", "bsubdown39", "bsubdown40", 
		"bsubdown41", "bsubdown42", "bsubdown43", "bsubdown44", "bsubdown45", "bsubdown46", "bsubdown47", 
		"bsubdown48", "bsubdown49", "bsubdown50", "bsubdown51", "bsubdown52", "bsubdown53", "bsubdown54", 
		"bsubdown55", "bsubdown56", "bsubdown57", "bsubdown58", "bsubdown59", "bsubdown60", "bsubdown61", 
		"bsubdown62", "bsubdown63", "bsubdown64", "bsubdown65", "bsubdown66", "bsubdown67"]; 
		waituntil {
			sleep (2 + random 2);
			true;
		};
		[_this, _manDown] call gokovo_fnc_globalSay3d;
	};
};

if (isPlayer _instigator && !goko_vo_konfirms) exitWith{};

private _visibility = [_unit, "VIEW"] checkVisibility [eyePos _unit,  AGLToASL (_instigator modelToWorldVisual (_instigator selectionPosition "Spine3"))];
if (_visibility == 0) then {
	_visibility = [_unit, "VIEW"] checkVisibility [eyePos _unit, AGLToASL (_instigator modelToWorldVisual (_instigator selectionPosition "Head"))];
};
/*  Check whether instigator can see victim fully on killed event. */
if (_visibility < 0.03) exitWith{};

/*Find out instigators' Side, pass - remoteExec next function to instigator */
switch (true) do {
	case (_instigator isKindOf "soldiereb") : {[_unit, _instigator] remoteExec ["gokoVO_fnc_opforConfirmKill", _instigator]};
	case (_instigator isKindOf "soldiergb") : {[_unit, _instigator] remoteExec ["gokoVO_fnc_IndependentConfirmKill", _instigator]};
	case (!goko_vo_BLUFORcompatibility && faction _unit != faction _instigator) : {[_unit, _instigator] remoteExec ["gokoVO_fnc_bluforConfirmKill", _instigator]};
};
