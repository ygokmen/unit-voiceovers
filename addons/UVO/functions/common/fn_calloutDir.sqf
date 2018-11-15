/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Calls directional callout phrases

Parameters:
0: Unit that initiates callout (player) <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

if (isPlayer _unit && !UVO_option_clientEnabled) exitWith {};

// Attempt to force unit to 'know about' object (cursorTarget may not work on first key press or until target is 'known')
_unit reveal cursorObject;

private _target = cursorTarget;

// Try to prevent spam
if (diag_tickTime < (_unit getVariable ["UVO_unitLastCalloutTime",0]) + 2) exitWith {};

// Stop if target is not a valid, alive, enemy entity
if (isNull _target || {!alive _target || {(side _unit) getFriend (side _target) >= 0.6}}) exitWith {};

// Stop if unit is not alive/unconscious OR doesnt have compass
if (!alive _unit || {(_unit getVariable ["ACE_isUnconscious",false]) || {!("ItemCompass" in (assignedItems _unit))}}) exitWith {};

// Stop if unit is inside a vehicle, except if its a static weapon
if (!(_unit in _unit) && {!((objectParent _unit) isKindOf "StaticWeapon")}) exitWith {};

// Stop if unit is using launcher (don't want callouts when locking onto something)
if (currentWeapon _unit == secondaryWeapon _unit) exitWith {};

// Determine callout direction
private _azimuth = getDir _unit;
private _calloutDir = switch (true) do {
	case (_azimuth < 17) : {0};
	case (_azimuth < 73) : {1};
	case (_azimuth < 107) : {2};
	case (_azimuth < 163) : {3};
	case (_azimuth < 197) : {4};
	case (_azimuth < 253) : {5};
	case (_azimuth < 287) : {6};
	case (_azimuth < 343) : {7};
	default {0};
};

// Finish up
_unit setVariable ["UVO_unitLastCalloutTime",diag_tickTime];
private _unitNationality = _unit getVariable "UVO_unitNationality";
[_unit,selectRandom ((missionNamespace getVariable (format["UVO_callouts_%1",_unitNationality])) # _calloutDir)] call UVO_fnc_globalSay3D;
