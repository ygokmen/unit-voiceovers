/*--------------------------------------------------------
Author: Gökmen
Modified FiredMan EH function for 'lazy suppression' (UVO version)

Parameters:
["_shooter", "_target", "_weapon", "_ammo"];

Return Value: -
----------------------------------------------------------*/
params 	["_shooter", "_target", "_weapon", "_ammo"];

if (!UVO_option_clientEnabled) exitWith {};

private _currentSuppression = getSuppression _target;
//if that is the case, we want to increment loop's inner suppress value (not too much tho)
if (_currentSuppression > 0 && {_currentSuppression < 1} ) then {
	_target setSuppression ((_currentSuppression min 0.75) + 0.14 + random 0.1);
} else {
	//reinitialize if suppression value goes out of range somehow or stuck to 1 (happens in vehicles)
	if !(getSuppression _target isEqualTo 0) exitWith { _target setSuppression 0; };
		
	private _munition = switch true do {
		case (_weapon isKindOf ["LauncherCore", configFile >> "CfgWeapons"]) : {["rocket", 0.95]};
		default {["bullet", 0.55]};
	};
	private _suppressionType = _munition # 0 + "Suppression";
	private _nationality = _target getVariable "UVO_nationality";
	private _calculatedImpactTime = ceil ( (_target distance _shooter) / 
		(getNumber(configfile >> "CfgAmmo" >> _ammo >> "typicalSpeed")) * 10) * 0.1;

	//run code immediately if distance/bulletspeed have small ratio (CQB), else simulate delay 
	if (_calculatedImpactTime > 0.2) then {
		[{ params ["_target","_suppressionType","_nationality"];
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
	_target setVariable ["UVO_suppressedTimer", cba_missiontime + 10];

	//entry point for mod compatibility (goko lazy suppression)
	if !(UVO_GLSLoaded) exitWith {};
	//call extended compat function(dont spawn) it with all params in case we need later on
	[_shooter, _target, _weapon, _ammo, _munition] call GLS_fnc_UVO;
};
