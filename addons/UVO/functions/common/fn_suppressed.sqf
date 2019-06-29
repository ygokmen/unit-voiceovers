/*--------------------------------------------------------
Author: Gökmen
Emits 'suppressed' VO's according to projectile type

Parameters:
0: Instigator <OBJECT>
1: Suppressed unit <OBJECT>
2: Weapon <STRING>
3: Ammo <STRING>

Return Value: -
----------------------------------------------------------*/
params ["_instigator","_suppressedUnit","_weapon","_ammo"];

private _suppressionType = (["bullet","rocket"] select (_weapon isKindOf ["LauncherCore",configFile >> "CfgWeapons"])) + "Suppression";
private _nationality = _suppressedUnit getVariable "UVO_nationality";
private _calculatedImpactTime = (_suppressedUnit distance _instigator) / (getNumber (configfile >> "CfgAmmo" >> _ammo >> "typicalSpeed"));

//run code immediately if distance/bulletspeed have small ratio (CQB),else simulate delay
if (_calculatedImpactTime < 0.2) then {
	[_suppressedUnit,selectRandom (
		missionNamespace getVariable format ["UVO_%1_%2",_suppressionType,_nationality]
	)] call UVO_fnc_globalSay3D;
} else {
	[{
		params ["_suppressedUnit","_suppressionType","_nationality"];

		[_suppressedUnit,selectRandom (
			missionNamespace getVariable format ["UVO_%1_%2",_suppressionType,_nationality]
		)] call UVO_fnc_globalSay3D;
	},[_suppressedUnit,_suppressionType,_nationality],_calculatedImpactTime] call CBA_fnc_waitAndExecute;
};
//update suppressed unit's tick
_suppressedUnit setVariable ["UVO_suppressedTimer",cba_missiontime + random 10 + random 10];
