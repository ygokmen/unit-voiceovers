/*--------------------------------------------------------
UVO_fnc_killedEH
Authors: Gökmen, Sceptre

Calls death shouts, 'ally down', and kill confirm phrases

Parameters:
(https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Killed)

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_killer","_instigator"];

// Prevent EH from firing twice
if (!isNil {_unit getVariable "UVO_isDead"}) exitWith {};
_unit setVariable ["UVO_isDead",true];

// Play death shout effect
if ((eyePos _unit # 2) > 0 && _unit getVariable ["UVO_allowDeathShouts",true]) then {
	playSound3D [selectRandom UVO_deathShouts,_unit,false,getPosASL _unit,UVO_option_deathShoutsVolume,1,UVO_option_maxDistDeathShouts];
};

// Have a nearby friendly call out 'friendly down' after a small delay
private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
if !(_nearFriendlies isEqualTo []) then {
	[{_this call UVO_fnc_allyDown;},[_nearFriendlies],2 + random 4] call CBA_fnc_waitAndExecute;
};

// ACE Medical Compatibility
if (UVO_ACEMedicalLoaded) then {_instigator = _unit getVariable ["ace_medical_lastDamageSource",objNull];};

// Verify instigator and roll the dice for kill confirm
if (!alive _instigator || isNil {_instigator getVariable "UVO_nationality"} ||
	!isPlayer _instigator && {UVO_option_killConfirmChanceAI <= random 1} ||
	isPlayer _instigator && {!UVO_option_clientEnabled || UVO_option_killConfirmChancePlayer <= random 1}
) exitWith {};

// Stop if the kill was by friendly fire
if ((side group _unit) getFriend (side group _instigator) >= 0.6) exitWith {};

// Check if the killer can see victim fully
private _visibility = [_instigator,"VIEW",_unit] checkVisibility [eyePos _instigator,AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "Spine3"))];

if (_visibility isEqualTo 0) then {
	_visibility = [_instigator,"VIEW",_unit] checkVisibility [eyePos _instigator,AGLToASL (_unit modelToWorldVisual (_unit selectionPosition "Head"))];
};
if (_visibility < 0.03) exitWith{};

// Make the instigator confirm the kill (executed where instigator is local)
[_instigator,_unit] remoteExec ["UVO_fnc_confirmKill",_instigator];
