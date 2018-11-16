/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Checks ambient interval / tick time

Parameters:
0: Unit or Group 

Return Value:
<BOOL>
----------------------------------------------------------*/
private _interval = _this getVariable ["UVO_ambInterval",(CBA_missionTime + (30 + random 60))];
if (CBA_missionTime < _interval) exitWith {false};

true
