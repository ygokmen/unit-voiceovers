/*--------------------------------------------------------
UVO_fnc_suppressed
Authors: Gökmen, Sceptre

Calls suppression and RPG phrases

Parameters:
0: Shooter <OBJECT>
1: Target <STRING>
2: Weapon <STRING>
3: Ammo <STRING>

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_shooter","_target","_projectileType","_ammo"];

if (isPlayer _target && {!UVO_option_clientEnabled}) exitWith {};

if (CBA_missionTime < _target getVariable "UVO_suppressedBuffer") exitWith {};
_target setVariable ["UVO_suppressedBuffer",CBA_missionTime + 10];

private _suppression = getSuppression _target;
if (isPlayer _target) then {
	if (_suppression >= 0 && _suppression <= 1) then {
		_target setSuppression ((_suppression min 0.75) + 0.14 + random 0.1);
	} else {
		if (getSuppression _target != 0) then {_target setSuppression 0;};
	};
};

if (_suppression isEqualTo 0 && _projectileType isEqualTo "bullet") exitWith {};

private _calculatedImpactTime = ceil ((_target distance _shooter) / (getNumber (configfile >> "CfgAmmo" >> _ammo >> "typicalSpeed")) * 10) * 0.1;
private _sound = selectRandom (missionNamespace getVariable format ["UVO_%1_%2",format ["%1Suppression",_projectileType],_target getVariable "UVO_nationality"]);

if (_calculatedImpactTime > 0.1) then {
	[{_this call UVO_fnc_globalSay3D;},[_target,_sound],_calculatedImpactTime] call CBA_fnc_waitAndExecute;
} else {
	[_target,_sound] call UVO_fnc_globalSay3D;
};
