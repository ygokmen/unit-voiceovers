/*--------------------------------------------------------
UVO_fnc_hitEH
Authors: Gökmen, Sceptre

Calls friendly fire and wounded phrases

Parameters:
(https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Hit)

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_source","_damage","_instigator"];

if (isPlayer _unit && !UVO_option_clientEnabled || _damage < 0.1) exitWith {};

private _nationality = _unit getVariable "UVO_nationality";

if ((side group _unit) getFriend (side group _instigator) >= 0.6) then {
	[_unit,selectRandom (missionNamespace getVariable format ["UVO_friendlyFire_%1",_nationality])] call UVO_fnc_globalSay3D;
} else {
	[_unit,selectRandom (missionNamespace getVariable format ["UVO_wounded_%1",_nationality])] call UVO_fnc_globalSay3D;
};
