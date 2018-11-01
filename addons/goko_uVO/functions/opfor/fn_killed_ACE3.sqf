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
/*	play sound sample on death */
playsound3d [format ["%1",_deathSound], _unit, false, getPosASL _unit, goko_vo_deathshouts_volume, 1, goko_vo_deathshouts_diameter];

/*	search for friendly unit around 50meter radius. */
_searchFriendly = (_unit nearEntities [["SoldierEB"], 50]) - [_unit];

/*	if unit found, plays 'man down!' sound. 'spawn' is necessary to add delay. */
if !(isnil {_searchFriendly #0}) then
{
	_foundFriendly = selectRandom _searchFriendly;
	if (isPlayer _foundFriendly && !goko_vo_client_enabled) exitWith{};
	_foundFriendly spawn {
		_manDown = selectRandom ["osubdown01", "osubdown02", "osubdown03", "osubdown04", "osubdown05", 
		"osubdown06", "osubdown07", "osubdown08", "osubdown09", "osubdown10", "osubdown11", "osubdown12", 
		"osubdown13", "osubdown14", "osubdown15", "osubdown16", "osubdown17", "osubdown18", "osubdown19", 
		"osubdown20", "osubdown21", "osubdown22", "osubdown23", "osubdown24", "osubdown25", "osubdown26"];
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
	case (_instigator isKindOf "soldierwb") : { [_unit, _instigator] remoteExec ["gokoVO_fnc_bluforConfirmKill", _instigator]; };
	case (_instigator isKindOf "soldiergb") : { [_unit, _instigator] remoteExec ["gokoVO_fnc_IndependentConfirmKill", _instigator]; };
	case (!goko_vo_OPFORcompatibility && faction _unit != faction _instigator) : { [_unit, _instigator] remoteExec ["gokoVO_fnc_opforConfirmKill", _instigator]; };
};
