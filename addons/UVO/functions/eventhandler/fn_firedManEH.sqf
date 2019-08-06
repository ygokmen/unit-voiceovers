/*--------------------------------------------------------
Author: Gökmen
FiredMan EH function for 'lazy suppression' (UVO version)

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#FiredMan)

Return Value: -
----------------------------------------------------------*/
params ["_shooter","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

if (CBA_missionTime < _shooter getVariable "UVO_suppressTimer") exitWith {};

private _target = if (isPlayer _shooter) then {cursorTarget} else {assignedTarget _shooter};

if (_target isKindOf "LandVehicle") then {
	private _dudesNearby = _target nearEntities ["CAManBase",20];
	if (_dudesNearby isEqualTo []) then {
		_target = selectRandom (crew vehicle _target);
	} else {
		_target = selectRandom _dudesNearby;
	};
};

if (isNil {_target getVariable "UVO_suppressedTimer"} || {
	_weapon in ["Put","Throw",""] || {
	!alive _target
}}) exitWith {_shooter setVariable ["UVO_suppressTimer",CBA_missionTime + 10];};

if (isPlayer _target) then {
	private _optimizeTick = if (UVO_GLSLoaded) then {1} else {10};
	/* entry point for mod compatibility (visual post-process efx):
	getsuppression return 0 on players. Will be using this check later on
	while incrementing supression on player artificially with the PP effect. */
	if (CBA_missionTime < _target getVariable "UVO_suppressedTimer"	&& {getSuppression _target isEqualTo 0}) exitWith {};
	[_shooter,_target,_weapon,_ammo] call UVO_fnc_targetIsPlayer;
	_shooter setVariable ["UVO_suppressTimer",CBA_missionTime + _optimizeTick];
} else {
	if (CBA_missionTime < _target getVariable "UVO_suppressedTimer") exitWith {};
	[_shooter,_target,_weapon,_ammo] call UVO_fnc_targetIsAI;
	_shooter setVariable ["UVO_suppressTimer",CBA_missionTime + 10];
};
