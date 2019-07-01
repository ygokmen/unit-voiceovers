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

//if that is the case, we want to increment loop's inner suppress values (not too much tho)
if (getSuppression _target > 0 && {getSuppression _target < 1} ) then {
	//lets just increment it, we deal with consequences later (if theres any)
	_target setSuppression ((getSuppression _target) + 0.1);
} else {
	
	if !(getSuppression _target isEqualTo 0) exitWith {};

	private _munition = switch true do {
		case (_weapon isKindOf ["LauncherCore", configFile >> "CfgWeapons"]) : {"rocket"};
		default {"bullet"};
	};
	private _suppressionType = _munition + "Suppression";
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

	//entry point for mod compatibility: never run unless specific variable is initialized.
	if (isNil"UVO_playerSuppCompatVariable") exitWith {}; 
	
	//[_shooter, _target, _weapon, _ammo] spawn gok_fnc_suppressionVisualsPlayerLoop;
	//start loop (HERE FOR TEST REASON)
	_target setSuppression 0;
	//TODO: write an actual method for compat function
	["ChromAberration", 200, [0.013, 0.013, true], _target, _suppressionType, _nationality] spawn uvo_fnc_playerLoop;
};
