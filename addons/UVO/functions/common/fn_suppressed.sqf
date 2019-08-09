/*--------------------------------------------------------
UVO_fnc_suppressed
Authors: Gökmen, Sceptre

Calls suppression and RPG phrases

Parameters:
0: Target <STRING>
1: Projectile type <STRING>

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_target","_projectileType"];

if (isPlayer _target && {!UVO_option_clientEnabled}) exitWith {};

if (CBA_missionTime < _target getVariable "UVO_suppressedBuffer" || (_projectileType isEqualTo "bullet" && random 1 < 0.15)) exitWith {};
_target setVariable ["UVO_suppressedBuffer",CBA_missionTime + 15 + round random 10];

[_target,selectRandom (missionNamespace getVariable format ["UVO_%1_%2",format ["%1Suppression",_projectileType],_target getVariable "UVO_nationality"])] call UVO_fnc_globalSay3D;
