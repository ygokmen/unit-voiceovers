params ["_unit"];

if (isPlayer _unit && !UVO_option_clientEnabled || !isNull cursorTarget) exitWith{};

private _isEnemy = (side group _unit) getFriend (side group cursorTarget) < 0.6;
private _isWeaponLauncher = currentWeapon _unit == secondaryWeapon _unit;
private _isMan = cursorTarget iskindof "MAN";
if (!_isEnemy || !("ItemCompass" in (assignedItems _unit)) || !alive cursorTarget || !_isMan || _isWeaponLauncher) exitWith{};

private "_calloutDir";
_azimuth = getDir _unit;

switch (true) do {
	case (_azimuth < 17) : {_calloutDir = "N";};
	case (_azimuth < 73) : {_calloutDir = "NE";};
	case (_azimuth < 107) : {_calloutDir = "E";;
	case (_azimuth < 163) : {_calloutDir = "SE";};
	case (_azimuth < 197) : {_calloutDir = "S";};
	case (_azimuth < 253) : {_calloutDir = "SW";};
	case (_azimuth < 287) : {_calloutDir = "W";};
	case (_azimuth < 343) : {_calloutDir = "NW";};
	default {_calloutDir = "N";};
};

private _unitNationality = _unit getVariable "UVO_unitNationality";
[_unit,selectRandom (missionNamespace getVariable (format["UVO_callout%1_%2",_calloutDir,_unitNationality]))] call UVO_fnc_globalSay3d;
