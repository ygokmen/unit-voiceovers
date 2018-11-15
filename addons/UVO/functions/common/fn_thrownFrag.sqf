/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Plays grenade alert phrase to nearby units when grenade has landed.

Parameters:
0: Grenade <OBJECT>
1: Grenade thrower's side <STRING>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_projectile","_throwerSide"];

[
	{
		(velocityModelSpace (_this # 0)) params ["_speedX","_speedY","_speedZ"];
		(abs _speedX) max (abs _speedY) max (abs _speedZ) < 5;
	},
	{
		params ["_projectile","_throwerSide"];

		// Find nearby enemies in 15 meter radius, stop if there are none
		private _nearEnemies = (_projectile nearEntities [["CAManBase"],15]) select {_throwerSide getFriend (side group _x) < 0.6};
		if (_nearEnemies isEqualTo []) exitwith {};
		
		// If players aren't supposed to use UVO then remove them from selection
		if (!UVO_option_clientEnabled && {(_nearEnemies findIf {isPlayer _x}) != -1}) then {
			_nearEnemies = _nearEnemies - (_nearEnemies select {isPlayer _x});
		};

		// Stop if there are no nearby enemies to use
		if (_nearEnemies isEqualTo []) exitwith {};

		// Get enemies that can say shit
		_nearEnemies = _nearEnemies select {alive _x && !(_x getVariable ["ACE_isUnconscious",false]) && !isNil {_x getVariable "UVO_unitNationality"}};

		// Stop if no units were available to use
		if (_nearEnemies isEqualTo []) exitwith {};

		// Get nearest usable enemy
		_nearEnemies = _nearEnemies apply {[_x distance _projectile, _x]};
		_nearEnemies sort true;
		private _nearestEnemy = _nearEnemies # 0 # 1;
		
		// Get the enemy unit's nationality
		private _unitNationality = _nearestEnemy getVariable "UVO_unitNationality";

		// "Grenade!"
		[_nearestEnemy,selectRandom (missionNamespace getVariable (format ["UVO_spotNade_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
	},
	[_projectile,_throwerSide],
	12,
	{}
] call CBA_fnc_waitUntilAndExecute;
