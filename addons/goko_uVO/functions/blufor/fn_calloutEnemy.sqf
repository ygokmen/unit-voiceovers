/*
	goko unit voice-overs addon direction call function
	author: gökmen
	website: https://github.com/the0utsider
	description: called from callouts_postinit via keybind
*/
params ["_unit"];

hasCompass = ("ItemCompass" in assignedItems(_unit));
_knowabouts = _unit knowsabout cursorTarget;
isWeaponLauncher = currentWeapon _unit == secondaryWeapon _unit;
isMan = cursorTarget iskindof "MAN";
if (!hasCompass || _knowabouts == 0 || !alive cursorTarget || !isMan || isWeaponLauncher ) exitWith{};

_northEast = selectRandom ["BenemyNE01", "BenemyNE02", "BenemyNE03", "BenemyNE04", "BenemyNE05", "BenemyNE06"];
_east = selectRandom ["Benemyeast01", "Benemyeast02", "Benemyeast03", "Benemyeast04", "Benemyeast05", "Benemyeast06"];
_southEast = selectRandom ["BenemySE01", "BenemySE02", "BenemySE03", "BenemySE04", "BenemySE05", "BenemySE06"];
_south = selectRandom ["Benemysouth01", "Benemysouth02", "Benemysouth03", "Benemysouth04", "Benemysouth05", "Benemysouth06"];
_southWest = selectRandom ["BenemySW01", "BenemySW02", "BenemySW03", "BenemySW04", "BenemySW05", "BenemySW06"];
_west = selectRandom ["Benemywest01", "Benemywest02", "Benemywest03", "Benemywest04", "Benemywest05", "Benemywest06"];
_northWest = selectRandom ["BenemyNW01", "BenemyNW02", "BenemyNW03", "BenemyNW04", "BenemyNW05", "BenemyNW06"];
_north = selectRandom ["Benemynorth01", "Benemynorth02", "Benemynorth03", "Benemynorth04", "Benemynorth05", "Benemynorth06"];
if (side _unit != side cursorTarget ) then
{
	_azimuth = getDir _unit;
	switch (true) do
	{
		case (_azimuth < 17) : {[_unit, _north] call gokovo_fnc_globalSay3d};
		case (_azimuth < 73) : {[_unit, _northEast] call gokovo_fnc_globalSay3d};
		case (_azimuth < 107) : {[_unit, _east] call gokovo_fnc_globalSay3d};
		case (_azimuth < 163) : {[_unit, _southEast] call gokovo_fnc_globalSay3d};
		case (_azimuth < 197) : {[_unit, _south] call gokovo_fnc_globalSay3d};
		case (_azimuth < 253) : {[_unit, _southWest] call gokovo_fnc_globalSay3d};
		case (_azimuth < 287) : {[_unit, _west] call gokovo_fnc_globalSay3d};
		case (_azimuth < 343) : {[_unit, _northWest] call gokovo_fnc_globalSay3d};
		default {[_unit, _north] call gokovo_fnc_globalSay3d};
	};
};
