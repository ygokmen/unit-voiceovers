/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Fired event handler script. Calls grenade, charge and reloading phrases

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Fired)

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

if (isPlayer _unit && !UVO_option_clientEnabled) exitWith {};

// Get unit's nationality
private _unitNationality = _unit getVariable "UVO_unitNationality";

// Did the unit throw a grenade/plant charge or fire his weapon
if (_weapon in ["Throw", "Put"]) then {
	// Find nearby friendlies in 40 meter radius, only run if there are any
	private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
	if (_nearFriendlies isEqualTo []) exitWith {};

	// Determine what type of grenade/charge and say appropriate phrase
	switch (true) do {
		case (_magazine in UVO_fragTypes) : {
			[_unit,selectRandom (missionNamespace getVariable (format ["UVO_frag_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
			[{_this call UVO_fnc_thrownFrag;},[_projectile,side group _unit],0.5] call CBA_fnc_waitAndExecute;
		};
		case (_magazine in UVO_smokeTypes) : {
			[_unit,selectRandom (missionNamespace getVariable (format ["UVO_smoke_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
		};
		case (_magazine in UVO_flashTypes) : {
			[_unit,selectRandom (missionNamespace getVariable (format ["UVO_flash_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
		};
		case (_magazine in UVO_incendiaryTypes) : {
			[_unit,selectRandom (missionNamespace getVariable (format ["UVO_incendiary_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
		};
		case (_magazine in UVO_explosiveTypes) : {
			[_unit,selectRandom (missionNamespace getVariable (format ["UVO_explosive_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
		};
	};
} else {
	// Stop if the magazine still has ammo in the mag
	if !(_weapon isEqualTo _muzzle && (_unit ammo _muzzle) isEqualTo 0) exitWith {};

	// Stop if unit is out of mags for current weapon
	if (getArray(configfile >> "CfgWeapons" >> _muzzle >> "magazines") arrayIntersect magazines _unit isEqualTo []) exitWith {};

	// Find nearby friendlies in 25 meter radius, only run if there are any
	private _nearFriendlies = ((_unit nearEntities [["CAManBase"],25]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
	if (_nearFriendlies isEqualTo []) exitWith {};

	if (isPlayer _unit)	then {
		// If unit is a player, Creat PFH to check when player reloads or changes weapon.
		[
			{
				params ["_args","_PFHID"];
				_args params ["_unit","_muzzle","_unitNationality"];
				
				if (inputAction "reloadMagazine" > 0) exitwith {
					[_unit,selectRandom (missionNamespace getVariable (format ["UVO_reloading_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
					_PFHID call CBA_fnc_removePerFrameHandler;
				};

				if (!alive _unit || !(currentMuzzle _unit isEqualTo _muzzle)) exitWith {
					_PFHID call CBA_fnc_removePerFrameHandler;
				};
			},
			0,
			[_unit,_muzzle,_unitNationality]
		] call CBA_fnc_addPerFrameHandler;
	} else {
		// If the unit is an AI, go ahead and make him say 'reloading'
		[_unit,selectRandom (missionNamespace getVariable (format ["UVO_reloading_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
	};
};
