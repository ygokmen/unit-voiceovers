/*
	goko unit voice-overs addon reloaded sub-function for ammo low call outs
	author: gökmen
	website: https://github.com/the0utsider
	description: called inside main reload function if last clip reloaded
*/
params ["_unit"];

_getFriends = (_unit nearEntities [["soldierwb"], 50]) - [_unit];
if (isnil{_getFriends #0}) exitwith {};

if (currentweapon _unit != secondaryweapon _unit) then
{
	_unitAmmoLowSample = selectRandom ["blowammo01", "blowammo02", "blowammo03", 
	"blowammo04", "blowammo05", "blowammo06"];
	[_unit, _unitAmmoLowSample] call gokovo_fnc_globalSay3d;
}
else
{
	_yanci = selectrandom _getFriends;
	_friendlyCoveringSample = selectRandom ["bcover01", "bcover02", "bcover03",
	"bcover04", "bcover10", "bcover11", "bcover12", "bcover13"];
	[_yanci, _friendlyCoveringSample] call gokovo_fnc_globalSay3d;
};
