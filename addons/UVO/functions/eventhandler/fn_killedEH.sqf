/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Killed event handler script. Calls death shouts, 'allyDown', and kill confirm phrases

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Killed) for more info

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_killer","_instigator","_useEffects"];

// Prevent EH from firing twice
if (!isNil {_unit getVariable "UVO_unitIsDead"}) exitWith {};
_unit setVariable ["UVO_unitIsDead", true];

// Play death shout effect
playSound3D [selectRandom (missionNamespace getVariable "UVO_deathShout"), _unit, false, getPosASL _unit, UVO_option_deathShoutsVolume, 1, UVO_option_deathShoutsDiameter];
//playSound3D [([(str missionConfigFile), 0, -15] call BIS_fnc_trimString) + selectRandom (missionNamespace getVariable "UVO_deathShout"), _unit, false, getPosASL _unit, UVO_option_deathShoutsVolume, 1, UVO_option_deathShoutsDiameter];

// Find nearby friendlies in 40 meter radius
private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};

// If there are friendlies around, make them say 'man down'
if !(_nearFriendlies isEqualTo []) then
{
	// If players aren't supposed to use UVO then removed them from selection
	if (!UVO_option_clientEnabled && (_nearFriendlies findIf {isPlayer _x}) != -1) exitWith {
		_nearFriendlies = _nearFriendlies - (_nearFriendlies select {isPlayer _x});
	};

	if (_nearFriendlies isEqualTo []) exitWith {};

	private _friendlyUnit = selectRandom _nearFriendlies;

	// Do the rest after small delay for realism
	[
		{
			params ["_friendlyUnit"];

			// Get friendly unit's nationality
			private _unitNationality = _friendlyUnit getVariable "UVO_unitNationality";
			if (isNil "_unitNationality") exitWith {};

			// "We've got a man down"
			[_friendlyUnit,(selectRandom (missionNamespace getVariable (format["UVO_allyDown_%1",_unitNationality])))] call UVO_fnc_globalSay3D;
		},
		[_friendlyUnit],
		(1.5 + random 1.5)
	] call CBA_fnc_waitAndExecute;
};

// ACE3 Compatibility
if (UVO_ACE3Loaded) then {
	_instigator = _unit getVariable "ace_medical_lastDamageSource";
};

// Chance for kill confirm
private _isPlayer = isPlayer _instigator;
if ((!_isPlayer && UVO_option_killConfirmChanceAI <= random 1) || (_isPlayer && UVO_option_killConfirmChancePlayer <= random 1)) exitWith {};

// Stop if the kill was by friendly fire
if ((side group _unit) getFriend (side group _instigator) >= 0.6) exitWith {};

// Check whether instigator can see victim fully
private _visibility = [vehicle _unit,"VIEW",vehicle _instigator] checkVisibility [eyePos _unit, AGLToASL (_instigator modelToWorldVisual (_instigator selectionPosition "Spine3"))];

if (_visibility isEqualTo 0) then {
	_visibility = [vehicle _unit, "VIEW",vehicle _instigator] checkVisibility [eyePos _unit, AGLToASL (_instigator modelToWorldVisual (_instigator selectionPosition "Head"))];
};

if (_visibility < 0.03) exitWith{};

// Run confirmKill function on the instigator's client
[_instigator,_unit] remoteExecCall ["UVO_fnc_confirmKill", _instigator];
