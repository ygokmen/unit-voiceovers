/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Plays random radio transmissions

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#AnimChanged)

Return Value: Nothing
----------------------------------------------------------*/
params ["_unit", "_anim"];

if !("ItemRadio" in (assignedItems _unit) || UVO_option_ambientEnabled) exitWith{};

private _postpone = diag_tickTime + (random 30 + random 30);
private _getLastTick = _unit getVariable "UVO_genericTransmissionTickTime";

if (isNil "_getLastTick") exitWith {_unit setVariable ["UVO_genericTransmissionTickTime", _postpone]};
if (diag_tickTime < _getLastTick) exitWith{};

_unit setVariable ["UVO_genericTransmissionTickTime", _postpone];

if (random 1 > 0.42) exitWith{};

[_unit, (selectRandom (missionNamespace getVariable "UVO_ambientRadio"))] call UVO_fnc_globalSay3D;
