/*--------------------------------------------------------
Authors: Sceptre
Reinitializes certain UVO functions on a unit that had its locality changed

Parameters:
0: Unit <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

private _killedEHID = _unit addEventhandler ["Killed",{_this call UVO_fnc_killedEH;}];
_unit setVariable ["UVO_killedEHID",_killedEHID];

// Stop here if no nationality defined (in case of being disabled)
if (isNil {_unit getVariable "UVO_nationality"}) exitWith {};

private _firedEHID = _unit addeventhandler ["Fired",{_this call UVO_fnc_firedEH;}];
private _hitEHID = _unit addEventHandler ["Hit",{_this call UVO_fnc_hitEH;}];
private _reloadedEHID = _unit addEventhandler ["Reloaded",{_this call UVO_fnc_reloadedEH;}];
private _localEHID = _unit addEventhandler ["Local",{_this call UVO_fnc_localEH;}];
private _firedManEHID = _unit addEventhandler ["FiredMan",{_this call UVO_fnc_firedManEH;}];
_unit setVariable ["UVO_EHIDs",[_firedEHID,_hitEHID,_reloadedEHID,_localEHID,_firedManEHID]];
