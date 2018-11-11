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

if (isNil "_interval") exitWith {_item setVariable ['UVO_ambInterval',(diag_tickTime + (random 50 + random 50))]; false};
if (diag_tickTime < _interval) exitWith {false};

true
