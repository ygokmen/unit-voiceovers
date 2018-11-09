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

// Play death shout effect - check if underwater
if !(eyePos _unit # 2 < 0) then {
	playSound3D [selectRandom (missionNamespace getVariable "UVO_deathShout"), _unit, false, getPosASL _unit, UVO_option_deathShoutsVolume, 1, UVO_option_deathShoutsDiameter];
};

// Find nearby friendlies in 40 meter radius
private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};

// If there are friendlies around, make them say 'friendly down'
if !(_nearFriendlies isEqualTo []) then
{
	// If players aren't supposed to use UVO then removed them from selection
	if (!UVO_option_clientEnabled && (_nearFriendlies findIf {isPlayer _x}) != -1) then {
		_nearFriendlies = _nearFriendlies - (_nearFriendlies select {isPlayer _x});
	};

	// Stop if there are no nearby friendlies to use
	if (_nearFriendlies isEqualTo []) exitWith {};

	// Select friendly unit that can say shit
	private _friendlyUnit = selectRandom (_nearFriendlies select {!isNil {_x getVariable "UVO_unitNationality"} && alive _x});
	
	// Stop if no units are available to use
	if (isNil "_friendlyUnit") exitWith {};

	// Do the rest after small delay for realism
	[
		{
			params ["_friendlyUnit"];

			if (alive _friendlyUnit) then {
				// Get friendly unit's nationality
				private _unitNationality = _friendlyUnit getVariable "UVO_unitNationality";

				// "Man down!"
				[_friendlyUnit,(selectRandom (missionNamespace getVariable (format["UVO_allyDown_%1",_unitNationality])))] call UVO_fnc_globalSay3D;
			};
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

// Stop if instigator is dead or no nationality is defined
if (!alive _instigator || isNil {_instigator getVariable "UVO_unitNationality"}) exitWith {};

// Check if the killer can see victim fully
private _visibility = [_instigator,"VIEW",_unit] checkVisibility [eyePos _instigator,AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "Spine3"))];

if (_visibility isEqualTo 0) then {
	_visibility = [_instigator,"VIEW",_unit] checkVisibility [eyePos _instigator,AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "Head"))];
};

// Stop if there's no clear line of sight
if (_visibility < 0.03) exitWith{};

// Make the instigator confirm the kill if possible (executed where instigator is local because of randomLip)
[_instigator,_unit] remoteExec ["UVO_fnc_confirmKill",_instigator];
