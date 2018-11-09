/*--------------------------------------------------------
Authors: Sceptre
Reinitializes UVO on transferred unit

Parameters:
0: Unit to reinitilize UVO stuff on <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

// Make it so unit can talk with UVO_fnc_globalSay3D
_unit setVariable ["UVO_unitRandomLip",false];

// Add necessary Event Handlers
private _hitEHID = _unit addEventHandler ["Hit",{_this call UVO_fnc_hitEH}];
private _firedEHID = _unit addeventhandler ["Fired",{_this call UVO_fnc_firedEH}];
private _killedEHID = _unit addEventhandler ["Killed",{_this call UVO_fnc_killedEH}];
private _reloadedEHID = _unit addEventhandler ["Reloaded",{_this call UVO_fnc_reloadedEH}];
private _localEHID = _unit addEventhandler ["Local",{_this call UVO_fnc_localEH}];

_unit setVariable ["UVO_unitEHIDs",[_hitEHID,_firedEHID,_killedEHID,_reloadedEHID,_localEHID]];
