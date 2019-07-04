/*--------------------------------------------------------
Author: Gökmen
FiredMan EH function for 'lazy suppression' (UVO version)

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#FiredMan)

Return Value: -
----------------------------------------------------------*/
params ["_shooter", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

if (cba_missiontime < _shooter getVariable "UVO_suppressTimer") exitWith {};

if (isPlayer _shooter) then {
	private _target = cursorTarget;
	[
		_shooter,
		_target,
		_weapon,
		_ammo
	] call uvo_fnc_shooterIsPlayer;
} else { 
	private _target = assignedTarget _shooter;
	[
		_shooter,
		_target,
		_weapon,
		_ammo
	] call uvo_fnc_shooterIsAI; 
};
