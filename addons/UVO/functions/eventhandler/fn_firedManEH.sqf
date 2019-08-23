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
params ["_shooter","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_vehicle"];

if (_weapon in ["Put","Throw",""]) exitWith {};

if (_weapon isKindOf ["LauncherCore",configFile >> "CfgWeapons"]) then {
	UVO_projectileList pushBack [_projectile,true,0];
} else {
	if (CBA_missionTime < _shooter getVariable "UVO_suppressingBuffer") exitWith {};
	_shooter setVariable ["UVO_suppressingBuffer",CBA_missionTime + 2 + random 2];
	UVO_projectileList pushBack [_projectile,false,CBA_missionTime + 0.03];
};
