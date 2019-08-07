/*--------------------------------------------------------
UVO_fnc_firedManEH
Authors: Gökmen, Sceptre

Handles suppression mechanic

Parameters:
(https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#FiredMan)

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_shooter","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

if (_weapon in ["Put","Throw",""] || CBA_missionTime < _shooter getVariable "UVO_suppressingBuffer") exitWith {};
_shooter setVariable ["UVO_suppressingBuffer",CBA_missionTime + 10];

private _target = if (isPlayer _shooter) then {cursorTarget} else {assignedTarget _shooter};
private _projectileType = ["bullet","rocket"] select (_weapon isKindOf ["LauncherCore",configFile >> "CfgWeapons"]);

if (_projectileType isEqualTo "rocket" && {_target isKindOf "LandVehicle"}) then {
	private _dudesNearby = _target nearEntities ["CAManBase",20];
	if (_dudesNearby isEqualTo []) then {
		_target = selectRandom (crew vehicle _target);
	} else {
		_target = selectRandom _dudesNearby;
	};
};

if (!alive _target || {isNil {_target getVariable "UVO_nationality"}}) exitWith {};

[_shooter,_target,_projectileType,_ammo] remoteExecCall ["UVO_fnc_suppressed",_target];
