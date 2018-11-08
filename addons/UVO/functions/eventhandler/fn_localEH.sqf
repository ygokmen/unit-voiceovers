/*--------------------------------------------------------
Authors: Sceptre
Re-initializes necessary stuff if unit's ownership is transferred.

Parameters:
0: The unit that had locality changed <OBJECT>

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
private _localEHID = _unit addEventhandler ["Local",{
	params ["_unit","isLocal"];
	(_unit getVariable "UVO_unitEHIDs") params ["_hitEHID","_firedEHID","_killedEHID","_reloadedEHID","_localEHID"];

	_unit removeEventHandler ["Hit",_hitEHID];
	_unit removeEventHandler ["Fired",_firedEHID];
	_unit removeEventHandler ["Killed",_killedEHID];
	_unit removeEventHandler ["Reloaded",_reloadedEHID];
	_unit removeEventHandler ["Local",_localEHID];
	[_unit] remoteExec ["UVO_fnc_localEH",_unit];
}];

_unit setVariable ["UVO_unitEHIDs",[_hitEHID,_firedEHID,_killedEHID,_reloadedEHID,_localEHID],true];
