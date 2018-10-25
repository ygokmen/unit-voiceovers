/*
	goko unit voice-overs addon reloaded sub-function for ammo low call outs
	author: gökmen
	website: https://github.com/the0utsider
	description: called inside main reload function if last clip reloaded
*/
params ["_unit"];

_getFriends = (_unit nearEntities [["soldiereb"], 50]) - [_unit];
if (isnil{_getFriends #0}) exitwith {};

if (currentweapon _unit != secondaryweapon _unit) then
{
	_unitAmmoLowSample = selectRandom ["olowammo01", "olowammo02", 
	"olowammo03", "olowammo04",	"olowammo05"];
	[_unit, _unitAmmoLowSample] call gokovo_fnc_globalSay3d;
}
else
{
	_yanci = selectrandom _getFriends;
	_friendlyCoveringSample = selectRandom ["opcover01", "opcover02", "opcover03", 
	"opcover14", "opcover15", "opcover16", "opcover17", "opcover18"];
	[_yanci, _friendlyCoveringSample] call gokovo_fnc_globalSay3d;
};
