/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Killed event handler script. Calls death shouts, 'allyDown', and kill confirm phrases

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Killed)

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_killer","_instigator","_useEffects"];

// Prevent EH from firing twice
if (!isNil {_unit getVariable "UVO_unitIsDead"}) exitWith {};
_unit setVariable ["UVO_unitIsDead",true];

// Play death shout effect - check if underwater
if !(eyePos _unit # 2 < 0) then {
	playSound3D [selectRandom (missionNamespace getVariable "UVO_deathShout"),_unit,false,getPosASL _unit,UVO_option_deathShoutsVolume,1,UVO_option_deathShoutsDiameter];
};

// Find nearby friendlies in 40 meter radius
private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};

if !(_nearFriendlies isEqualTo []) then
{
	// Have a nearby friendly call out 'friendly down' after a small delay
	[{_this call UVO_fnc_allyDown;},[_nearFriendlies],(2 + random 1)] call CBA_fnc_waitAndExecute;
};

// ACE3 Compatibility
if (UVO_ACE3Loaded) then {
	_instigator = _unit getVariable ["ace_medical_lastDamageSource",objNull];
};

// Chance for kill confirm
private _isPlayer = isPlayer _instigator;
if (isNull _instigator || (!_isPlayer && UVO_option_killConfirmChanceAI <= random 1) || (_isPlayer && UVO_option_killConfirmChancePlayer <= random 1)) exitWith {};

// Stop if the kill was by friendly fire
if ((side group _unit) getFriend (side group _instigator) >= 0.6) exitWith {};

// Stop if instigator is dead or no nationality is defined
if (!alive _instigator || isNil {_instigator getVariable "UVO_unitNationality"}) exitWith {};

// Check if the killer can see victim fully
private _visibility = [_instigator,"VIEW",_unit] checkVisibility [eyePos _instigator,AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "Spine3"))];

if (_visibility isEqualTo 0) then {
	_visibility = [_instigator,"VIEW",_unit] checkVisibility [eyePos _instigator,AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "Head"))];
};
if (_visibility < 0.03) exitWith{};

// Make the instigator confirm the kill (executed where instigator is local)
[_instigator,_unit] remoteExec ["UVO_fnc_confirmKill",_instigator];
