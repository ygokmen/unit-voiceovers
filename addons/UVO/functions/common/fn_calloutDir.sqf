/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Calls directional callout phrases

Parameters:
0: Unit that initiates callout <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

if (isPlayer _unit && !UVO_option_clientEnabled) exitWith {};

// Prevent spam
if (diag_tickTime < (_unit getVariable ["UVO_unitLastCalloutTime",0]) + 2) exitWith {};
_unit setVariable ["UVO_unitLastCalloutTime",diag_tickTime];

// Check if unit is not alive/unconscious or in a vehicle
if (!alive _unit || (_unit getVariable ["ACE_isUnconscious",false])) exitWith {};

// Stop if unit is inside a vechicle, except if its a static weapon
if (!(isNull objectParent _unit) && !((vehicle _unit) isKindOf "StaticWeapon")) exitWith {};

// More misc checks
private _targetIsFriendly = (side group _unit) getFriend (side group cursorTarget) >= 0.6;
private _isWeaponLauncher = currentWeapon _unit == secondaryWeapon _unit;
if (!alive cursorTarget || _targetIsFriendly || !("ItemCompass" in (assignedItems _unit)) || _isWeaponLauncher) exitWith {};

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

private _unitNationality = _unit getVariable "UVO_unitNationality";
[_unit,selectRandom ((missionNamespace getVariable (format["UVO_callouts_%1",_unitNationality])) # _calloutDir)] call UVO_fnc_globalSay3D;
