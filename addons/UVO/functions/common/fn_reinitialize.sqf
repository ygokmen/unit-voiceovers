/*--------------------------------------------------------
Authors: Sceptre
Reinitializes certain UVO functions on a unit that had locality changed

Parameters:
0: Unit to reinitilize UVO stuff on <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

_unit setVariable ["UVO_unitTalking",false];
private _firedEHID = _unit addeventhandler ["Fired",{_this call UVO_fnc_firedEH}];
private _hitEHID = _unit addEventHandler ["Hit",{_this call UVO_fnc_hitEH}];
private _killedEHID = _unit addEventhandler ["Killed",{_this call UVO_fnc_killedEH}];
private _localEHID = _unit addEventhandler ["Local",{_this call UVO_fnc_localEH}];
private _reloadedEHID = _unit addEventhandler ["Reloaded",{_this call UVO_fnc_reloadedEH}];
_unit setVariable ["UVO_unitEHIDs",[_firedEHID,_hitEHID,_killedEHID,_localEHID,_reloadedEHID]];
