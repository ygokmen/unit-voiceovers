/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Reloaded event handler script. Calls ammo low and cover phrases

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Reloaded)

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_weapon","_muzzle","_newMagazine","_oldMagazine"];

if (_weapon != _muzzle || !isNil "ace_arsenal_camera" || !isNil "RSCDisplayArsenal") exitWith {};

// Stop if unit still has mags for current weapon
if !((_weapon call CBA_fnc_compatibleMagazines) arrayIntersect (magazines _unit) isEqualTo []) exitWith {};

// Only run if there are friendlies in 40 meter radius
private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
if (_nearFriendlies isEqualTo []) exitWith {};

// If primary weapon, say ammo low. If it's a launcher, have a friendly say he's covering.
if (currentweapon _unit != secondaryweapon _unit) then {
	if (isPlayer _unit && !UVO_option_clientEnabled) exitWith {};

	private _nationality = _unit getVariable "UVO_nationality";
	[_unit,selectRandom (missionNamespace getVariable format ["UVO_ammoLow_%1",_nationality])] call UVO_fnc_globalSay3D;
} else {
	// If players aren't supposed to use UVO then removed them from selection
	if (!UVO_option_clientEnabled && {(_nearFriendlies findIf {isPlayer _x}) != -1}) then {
		_nearFriendlies = _nearFriendlies - (_nearFriendlies select {isPlayer _x});
	};
	if (_nearFriendlies isEqualTo []) exitWith {};

	// Select friendly unit that can say shit
	private _friendlyUnit = selectRandom (_nearFriendlies select {alive _x && !(_x getVariable ["ACE_isUnconscious",false]) && !isNil {_x getVariable "UVO_nationality"}});
	if (isNil "_friendlyUnit") exitWith {};

	private _nationality = _friendlyUnit getVariable "UVO_nationality";
	[_friendlyUnit,selectRandom (missionNamespace getVariable format ["UVO_cover_%1",_nationality])] call UVO_fnc_globalSay3D;
};
