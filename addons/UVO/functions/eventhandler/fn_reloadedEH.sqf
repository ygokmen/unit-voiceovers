params ["_unit","_weapon","_muzzle","_newMagazine","_oldMagazine"];

if (_weapon != _muzzle || !isNil "ace_arsenal_camera" || !isNil "RSCDisplayArsenal") exitWith {};

// Stop if unit is still has mags for current weapon
if !(getArray(configfile >> "CfgWeapons" >> _muzzle >> "magazines") arrayIntersect magazines _unit isEqualTo []) exitWith {};

// Find nearby friendlies in 50 meter radius
private _nearFriendlies = ((_unit nearEntities [["Man"], 50]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
if (_nearFriendlies isEqualTo []) exitWith {};

// If primary weapon, say ammo low. If it's a launcher, have a friendly say he's covering.
if (currentweapon _unit != secondaryweapon _unit) then {

	if (isPlayer _unit && !UVO_option_clientEnabled) exitWith {};

	// Get unit's nationality
	private _unitNationality = _unit getVariable "UVO_unitNationality";

	[_unit,selectRandom (missionNamespace getVariable (format ["UVO_ammoLow_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
} else {
	// If players aren't supposed to use UVO then removed them from selection
	if (!UVO_option_clientEnabled && (_nearFriendlies findIf {isPlayer _x}) != -1) then {
		_nearFriendlies = _nearFriendlies - (_nearFriendlies select {isPlayer _x});
	};

	if (_nearFriendlies isEqualTo []) exitWith {};
	
	private _friendlyUnit = selectrandom _nearFriendlies;

	// Get friendly unit's nationality
	private _unitNationality = _friendlyUnit getVariable "UVO_unitNationality";
	if (isNil "_unitNationality") exitWith {};
	
	[_friendlyUnit,selectRandom (missionNamespace getVariable (format ["UVO_other_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
};
