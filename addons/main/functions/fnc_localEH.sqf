/*--------------------------------------------------------
UVO_fnc_localEH
Authors: Sceptre

Removes event handlers and calls for reinitialization on
remote machine when unit locality has changed.

Parameters:
(https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Local)

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_isLocal"];

private _requiredEHIDs = _unit getVariable "UVO_requiredEHIDs";
if (!isNil "_requiredEHIDs") then {
	_requiredEHIDs params ["_killedEHID","_firedManEHID","_localEHID"];

	_unit removeEventHandler ["Killed",_killedEHID];
	_unit removeEventHandler ["FiredMan",_firedManEHID];
	_unit removeEventHandler ["Local",_localEHID];
	_unit setVariable ["UVO_requiredEHIDs",nil];
};

private _EHIDs = _unit getVariable "UVO_EHIDs";
if (!isNil "_EHIDs") then {
	_EHIDs params ["_firedEHID","_hitEHID","_reloadedEHID"];

	_unit removeEventHandler ["Fired",_firedEHID];
	_unit removeEventHandler ["Hit",_hitEHID];
	_unit removeEventHandler ["Reloaded",_reloadedEHID];
	_unit setVariable ["UVO_EHIDs",nil];
};

// Reinitialize unit on remote machine
[_unit] remoteExec [QFUNC(reinitialize),_unit];
