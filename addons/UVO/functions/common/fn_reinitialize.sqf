/*--------------------------------------------------------
UVO_fnc_reinitialize
Authors: Sceptre

Reinitializes UVO on a unit that had its locality changed

Parameters:
0: Unit <OBJECT>

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

private _killedEHID = _unit addEventhandler ["Killed",{_this call UVO_fnc_killedEH;}];
_unit setVariable ["UVO_killedEHID",_killedEHID];

// Stop here if no nationality defined (in case of being disabled)
if (isNil {_unit getVariable "UVO_nationality"}) exitWith {};

private _firedEHID = _unit addeventhandler ["Fired",{_this call UVO_fnc_firedEH;}];
private _firedManEHID = _unit addEventhandler ["FiredMan",{_this call UVO_fnc_firedManEH;}];
private _hitEHID = _unit addEventHandler ["Hit",{_this call UVO_fnc_hitEH;}];
private _reloadedEHID = _unit addEventhandler ["Reloaded",{_this call UVO_fnc_reloadedEH;}];
private _localEHID = _unit addEventhandler ["Local",{_this call UVO_fnc_localEH;}];
_unit setVariable ["UVO_EHIDs",[_firedEHID,_firedManEHID,_hitEHID,_reloadedEHID,_localEHID]];
_unit setVariable ["UVO_suppressTimer",0];
_unit setVariable ["UVO_suppressedTimer",0];
