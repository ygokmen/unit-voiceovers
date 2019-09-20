/*--------------------------------------------------------
UVO_fnc_thrownFrag
Authors: Gökmen, Sceptre

Calls grenade alert phrase to nearby units

Parameters:
0: Grenade <OBJECT>
1: Grenade thrower's side <STRING>

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_projectile","_throwerSide"];

[{
	(velocityModelSpace (_this # 0)) params ["_speedX","_speedY","_speedZ"];
	(abs _speedX) max (abs _speedY) max (abs _speedZ) < 5;
},{
	params ["_projectile","_throwerSide"];

	// Stop if there are no enemies in 12 meter radius
	private _nearEnemies = (_projectile nearEntities [["CAManBase"],12]) select {_throwerSide getFriend (side group _x) < 0.6};
	if (_nearEnemies isEqualTo []) exitwith {};

	// If players aren't supposed to use UVO then remove them from selection
	if (!UVO_option_clientEnabled && {(_nearEnemies findIf {isPlayer _x}) != -1}) then {
		_nearEnemies = _nearEnemies - (_nearEnemies select {isPlayer _x});
	};
	if (_nearEnemies isEqualTo []) exitwith {};

	// Get nearest enemy that can say shit
	_nearEnemies = _nearEnemies select {alive _x && !(_x getVariable ["ACE_isUnconscious",false]) && !isNil {_x getVariable "UVO_nationality"}};
	if (_nearEnemies isEqualTo []) exitwith {};
	_nearEnemies = _nearEnemies apply {[_x distance _projectile, _x]};
	_nearEnemies sort true;
	private _nearestEnemy = _nearEnemies # 0 # 1;

	// Finish up
	private _nationality = _nearestEnemy getVariable "UVO_nationality";
	[_nearestEnemy,selectRandom (missionNamespace getVariable format ["UVO_spotNade_%1",_nationality])] call FUNC(globalSay3D);
},[_projectile,_throwerSide],12,{}] call CBA_fnc_waitUntilAndExecute;
