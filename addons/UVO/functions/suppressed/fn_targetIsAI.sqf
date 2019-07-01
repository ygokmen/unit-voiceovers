/*--------------------------------------------------------
Author: Gökmen
Modified FiredMan EH function for 'lazy suppression' (clean version)

Parameters:
["_shooter", "_target", "_weapon", "_ammo"];

Return Value: -
----------------------------------------------------------*/
params 	["_shooter", "_target", "_weapon", "_ammo"];

private _munition = switch true do {
	case (_weapon isKindOf ["LauncherCore", configFile >> "CfgWeapons"]) : {"rocket"};
	default {"bullet"};
};
private _suppressionType = _munition + "Suppression";
private _nationality = _target getVariable "UVO_nationality";
private _calculatedImpactTime = 
	(_target distance _shooter) / (getNumber (configfile >> "CfgAmmo" >> _ammo >> "typicalSpeed"));

//run code immediately if distance/bulletspeed have small ratio (CQB), else simulate delay 
if (_calculatedImpactTime > 0.2) then {
	[{
		params ["_target","_suppressionType","_nationality"];

		[_target, selectRandom (
			missionNamespace getVariable format ["UVO_%1_%2", _suppressionType, _nationality]
		)] call UVO_fnc_globalSay3D;
	},[_target,_suppressionType,_nationality], _calculatedImpactTime] call CBA_fnc_waitAndExecute;
} else {
	[_target, selectRandom (
		missionNamespace getVariable format ["UVO_%1_%2", _suppressionType, _nationality]
	)] call UVO_fnc_globalSay3D;
};

//update suppressed unit's tick
_target setVariable ["UVO_suppressedTimer", cba_missiontime + 10 + random 20];
