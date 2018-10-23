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
_searchFriendly = _unit nearEntities [["SoldierGB"], 50];
_searchFriendly deleteAt (_searchFriendly find _unit);
/*	if unit found, plays 'man down!' sound. 'spawn' is necessary to add delay. */
if !(isnil {_searchFriendly #0}) then
{
	_foundFriendly = selectRandom _searchFriendly;
	_foundFriendly spawn {
		waituntil {	sleep (2 + random 2);	true; };
		_manDown = selectRandom [
			"insubdown01", "insubdown02", "insubdown03", "insubdown04", "insubdown05", "insubdown06", "insubdown07", "insubdown08", 
			"insubdown09", "insubdown10", "insubdown11", "insubdown12", "insubdown13", "insubdown14", "insubdown15", "insubdown16", 
			"insubdown17", "insubdown18", "insubdown19", "insubdown20", "insubdown21", "insubdown22", "insubdown23", "insubdown24", 
			"insubdown25", "insubdown26", "insubdown27"
			
			
		];
		[_this, _manDown] call gokovo_fnc_globalSay3d;
	};
};

private _visibility = [_unit, "VIEW"] checkVisibility [eyePos _unit,  AGLToASL (_instigator modelToWorldVisual (_instigator selectionPosition "Spine3"))];
if (_visibility == 0) then
{
	_visibility = [_unit, "VIEW"] checkVisibility [eyePos _unit, AGLToASL (_instigator modelToWorldVisual (_instigator selectionPosition "Head"))];
};

if (_visibility < 0.03) exitWith{};
/*	Check whether instigator can see victim fully on killed event. 
	Find out instigators' Side, pass - remoteExec next function to instigator */
switch (true) do {
	case (_instigator isKindOf "soldiereb") : { [_unit, _instigator] remoteExec ["gokoVO_fnc_opforConfirmKill", _instigator]; };
	case (_instigator isKindOf "soldierwb") : { [_unit, _instigator] remoteExec ["gokoVO_fnc_bluforConfirmKill", _instigator]; };
	case (!goko_vo_INDIcompatibility && faction _unit != faction _instigator) : { [_unit, _instigator] remoteExec ["gokoVO_fnc_IndependentConfirmKill", _instigator]; };
};
