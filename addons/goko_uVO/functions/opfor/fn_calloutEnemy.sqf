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

_northEast = selectRandom ["OenemyNE01", "OenemyNE02", "OenemyNE03"];
_east =	selectRandom ["Oenemyeast01", "Oenemyeast02", "Oenemyeast03"];
_southEast = selectRandom ["OenemySE01", "OenemySE02", "OenemySE03"];
_south = selectRandom ["Oenemysouth01", "Oenemysouth02", "Oenemysouth03"];
_southWest = selectRandom ["OenemySW01", "OenemySW02", "OenemySW03"];
_west = selectRandom ["Oenemywest01", "Oenemywest02", "Oenemywest03"];
_northWest = selectRandom ["OenemyNW01", "OenemyNW02", "OenemyNW03"];
_north = selectRandom ["Oenemynorth01", "Oenemynorth02", "Oenemynorth03"];

if (side _unit != side cursorTarget ) then 
{
	_azimuth = getDir _unit; 
	switch (true) do 
	{ 
		case (_azimuth < 17) : {[_unit, _north] call gokovo_fnc_globalSay3d}; 
		case (_azimuth < 73) : { [_unit, _northEast] call gokovo_fnc_globalSay3d; }; 
		case (_azimuth < 107) : { [_unit, _east] call gokovo_fnc_globalSay3d; }; 
		case (_azimuth < 163) : { [_unit, _southEast] call gokovo_fnc_globalSay3d; }; 
		case (_azimuth < 197) : { [_unit, _south] call gokovo_fnc_globalSay3d; }; 
		case (_azimuth < 253) : { [_unit, _southWest] call gokovo_fnc_globalSay3d; }; 
		case (_azimuth < 287) : { [_unit, _west] call gokovo_fnc_globalSay3d; }; 
		case (_azimuth < 343) : { [_unit, _northWest] call gokovo_fnc_globalSay3d; }; 
		default {[_unit, _north] call gokovo_fnc_globalSay3d}; 
	};
}; 
