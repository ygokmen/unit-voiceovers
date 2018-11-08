/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Reloaded event handler script. Calls ammo low and cover phrases

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Reloaded) for more info

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_weapon","_muzzle","_newMagazine","_oldMagazine"];

if (_weapon != _muzzle || !isNil "ace_arsenal_camera" || !isNil "RSCDisplayArsenal") exitWith {};

// Stop if unit is still has mags for current weapon
if !(getArray(configfile >> "CfgWeapons" >> _muzzle >> "magazines") arrayIntersect magazines _unit isEqualTo []) exitWith {};

// Find nearby friendlies in 40 meter radius, only run if there are any
private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
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
	
	[_friendlyUnit,selectRandom (missionNamespace getVariable (format ["UVO_cover_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
};
