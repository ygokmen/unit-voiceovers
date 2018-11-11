/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Calls directional callout phrases

Parameters:
0: Unit that initiates callout <OBJECT>

Return Value:
<BOOL> True if callout was made, false otherwise
----------------------------------------------------------*/
params ["_unit"];

if ((isPlayer _unit && !UVO_option_clientEnabled) || !isNull objectParent _unit) exitWith {false};

private _targetIsFriendly = (side group _unit) getFriend (side group cursorTarget) >= 0.6;
private _isWeaponLauncher = currentWeapon _unit == secondaryWeapon _unit;
if (!alive cursorTarget || _targetIsFriendly || !("ItemCompass" in (assignedItems _unit)) || _isWeaponLauncher) exitWith {false};

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
[_unit,selectRandom ((missionNamespace getVariable (format["UVO_callouts_%1",_unitNationality])) # _calloutDir)] call UVO_fnc_globalSay3d;

true
