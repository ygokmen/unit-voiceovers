/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Calls directional callout phrases

Parameters:
0: Unit that initiates callout <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

if ((isPlayer _unit && !UVO_option_clientEnabled) || !isNull objectParent _unit) exitWith {false};

private _targetIsFriendly = (side group _unit) getFriend (side group cursorTarget) >= 0.6;
private _isWeaponLauncher = currentWeapon _unit == secondaryWeapon _unit;
if (!alive cursorTarget || _targetIsFriendly || !("ItemCompass" in (assignedItems _unit)) || _isWeaponLauncher) exitWith {false};

private "_calloutDir";
private _azimuth = getDir _unit;

switch (true) do {
	case (_azimuth < 17) : {_calloutDir = "N"};
	case (_azimuth < 73) : {_calloutDir = "NE"};
	case (_azimuth < 107) : {_calloutDir = "E"};
	case (_azimuth < 163) : {_calloutDir = "SE"};
	case (_azimuth < 197) : {_calloutDir = "S"};
	case (_azimuth < 253) : {_calloutDir = "SW"};
	case (_azimuth < 287) : {_calloutDir = "W"};
	case (_azimuth < 343) : {_calloutDir = "NW"};
	default {_calloutDir = "N"};
};

private _unitNationality = _unit getVariable "UVO_unitNationality";
[_unit,selectRandom (missionNamespace getVariable (format["UVO_callout%1_%2",_calloutDir,_unitNationality]))] call UVO_fnc_globalSay3d;

true
