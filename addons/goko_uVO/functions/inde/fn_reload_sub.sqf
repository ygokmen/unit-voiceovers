/*
	goko unit voice-overs addon reloaded sub-function for ammo low call outs
	author: gökmen
	website: https://github.com/the0utsider
	description: called inside main reload function if last clip reloaded
*/
params ["_unit"];

_getFriends = (_unit nearEntities [["soldiergb"], 50]) - [_unit];
if (isnil{_getFriends #0}) exitwith {};
if (currentweapon _unit != secondaryweapon _unit) then
{
	_unitAmmoLowSample = selectRandom ["inlowammo01", "inlowammo02", "inlowammo03", 
	"inlowammo04", "inlowammo05", "inlowammo06"];
	
	[_unit, _unitAmmoLowSample] call gokovo_fnc_globalSay3d;
}
else
{
	_yanci = selectrandom _getFriends;
	
	_friendlyCoveringSample = selectRandom ["Incover01", "Incover02", 
	"Incover03", "Incover04", "Incover05", "Incover06", "Incover07", 
	"Incover08", "Incover09", "Incover10", "Incover12", "Incover14"];
	
	[_yanci, _friendlyCoveringSample] call gokovo_fnc_globalSay3d;
};
