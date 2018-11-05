params ["_unit","_killer","_instigator","_useEffects"];

// Play death shout effect
//playSound3D [selectRandom (missionNamespace getVariable "UVO_deathShout"), _unit, false, getPosASL _unit, UVO_option_deathShoutsVolume, 1, UVO_option_deathShoutsDiameter];
playSound3D [([(str missionConfigFile), 0, -15] call BIS_fnc_trimString) + selectRandom (missionNamespace getVariable "UVO_deathShout"), _unit, false, getPosASL _unit, UVO_option_deathShoutsVolume, 1, UVO_option_deathShoutsDiameter];

// Find nearby friendlies in 50 meter radius
private _nearFriendlies = ((_unit nearEntities [["Man"], 50]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};

// If there are friendlies around, make them say 'man down'
if !(_nearFriendlies isEqualTo []) then
{
	// If players aren't supposed to use UVO then removed them from selection
	if (!UVO_option_clientEnabled && (_nearFriendlies findIf {isPlayer _x}) != -1) exitWith {
		_nearFriendlies = _nearFriendlies - (_nearFriendlies select {isPlayer _x});
	};

	if !(_nearFriendlies isEqualTo []) exitWith {};

	private _friendlyUnit = selectRandom _nearFriendlies;

	[
		{
			// Get friendly unit's nationality
			private _unitNationality = _this getVariable "UVO_unitNationality";
			if (isNil "_unitNationality") exitWith {};

			// "We've got a man down"
			[_this,(selectRandom (missionNamespace getVariable (format["UVO_allyDown_%1",_unitNationality])))] call UVO_fnc_globalSay3D;
		},
		_friendlyUnit,
		(2 + random 2)
	] call CBA_fnc_waitAndExecute;
};

// Chance for kill confirm
if (UVO_option_killConfirmChance > random 1) exitWith {};

// ACE3 Compatibility
if (missionNamespace getVariable "UVO_ACE3Loaded") then {
	_instigator = _unit getVariable "ace_medical_lastDamageSource";
};

// Stop if the kill was by friendly fire
if ((side group _unit) getFriend (side group _instigator) >= 0.6) exitWith {};

// Stop if instigator is a player and UVO is disabled for players OR if kill confirms are disabled
if ((isPlayer _instigator && !UVO_option_clientEnabled) || !UVO_option_killConfirmEnabled) exitWith {};

// Check whether instigator can see victim fully
private _visibility = [_unit, "VIEW"] checkVisibility [eyePos _unit,  AGLToASL (_instigator modelToWorldVisual (_instigator selectionPosition "Spine3"))];

if (_visibility isEqualTo 0) then {
	_visibility = [_unit, "VIEW"] checkVisibility [eyePos _unit, AGLToASL (_instigator modelToWorldVisual (_instigator selectionPosition "Head"))];
};

if (_visibility < 0.03) exitWith{};

// Run confirmKill function on the instigator's client
[_instigator,_unit] remoteExecCall ["UVO_fnc_confirmKill", _instigator];
