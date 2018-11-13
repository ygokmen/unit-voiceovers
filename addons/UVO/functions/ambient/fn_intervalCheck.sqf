/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Checks ambient interval / tick time

Parameters:
0: Unit or Group 

Return Value:
<BOOL>
----------------------------------------------------------*/
params ["_item"];

private _interval = _item getVariable "UVO_ambInterval";

if (isNil "_interval") exitWith {_item setVariable ['UVO_ambInterval',(CBA_missionTime + (random 30 + random 30))]; false};
if (CBA_missionTime < _interval) exitWith {false};

true
