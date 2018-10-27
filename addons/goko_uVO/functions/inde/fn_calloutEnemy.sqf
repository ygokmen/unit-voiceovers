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

_northEast = selectRandom ["InenemyNE01", "InenemyNE02", "InenemyNE03"]; 
_east =	selectRandom ["Inenemyeast01", "Inenemyeast02", "Inenemyeast03"]; 
_southEast = selectRandom ["InenemySE01", "InenemySE02", "InenemySE03"]; 
_south = selectRandom ["Inenemysouth01", "Inenemysouth02", "Inenemysouth03"]; 
_southWest = selectRandom ["InenemySW01", "InenemySW02", "InenemySW03"]; 
_west = selectRandom ["Inenemywest01", "Inenemywest02", "Inenemywest03"]; 
_northWest = selectRandom ["InenemyNW01", "InenemyNW02", "InenemyNW03"]; 
_north = selectRandom ["Inenemynorth01", "Inenemynorth02", "Inenemynorth03"]; 

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
