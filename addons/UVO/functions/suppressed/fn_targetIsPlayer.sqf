/*--------------------------------------------------------
Author: Gökmen
Modified FiredMan EH function for 'lazy suppression' (clean version)

Parameters:
["_shooter", "_target", "_weapon", "_ammo"];

Return Value: -
----------------------------------------------------------*/
params 	["_shooter", "_target", "_weapon", "_ammo"];
/* script made it here because either we got 'suppressed' variable (unit being shot at)
 time tick was < cba_missionTime -or- getSuppression value was altered;
 which should be 0 by default for client has interface. so lets run another check...
 if it is not 0, we increment it. leave the rest for our loop. if there's no loop to
 set it to default 0 value, no worries, this value is affects AI FSM's anyway. */

private _currentSuppression = getSuppression _target;
//if that is the case, we want to increment loop's inner suppress values (not too much tho)
if (_currentSuppression > 0 && {_currentSuppression <= 1} ) then {
	//increment it
	_target setSuppression ((_currentSuppression min 0.9) + 0.1);
} else {

	private _munition = switch true do {
		case (_weapon isKindOf ["LauncherCore", configFile >> "CfgWeapons"]) : {["rocket", 0.9]};
		default {["bullet", 0.50]};
	};
	private _suppressionType = _munition # 0 + "Suppression";
	private _nationality = _target getVariable "UVO_nationality";
	private _calculatedImpactTime = (_target distance _shooter) / (getNumber (configfile >> "CfgAmmo" >> _ammo >> "typicalSpeed"));
	//update suppressed unit's tick time 
	_target setVariable ["UVO_suppressedTimer", cba_missiontime + 10];
	//do our regular UVO thing 
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

	//entry point for mod compatibility: 
	if (isNil"UVO_playerSuppCompatVariable") exitWith {}; 
/* 
	never run unless specific variable is initialized.
	[_shooter, _target, _weapon, _ammo] spawn gok_fnc_suppressionVisualsPlayerLoop;
	TODO: write an actual compatibility method
	start loop (HERE FOR TEST REASON) 
*/
	["ChromAberration", 200, [0.013, 0.013, true], _target, _munition # 1] spawn uvo_fnc_playerLoop;
};
