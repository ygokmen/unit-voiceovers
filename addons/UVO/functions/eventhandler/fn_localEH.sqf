/*--------------------------------------------------------
Authors: Sceptre
Removes local event handlers and calls for reinitialization on remote machine when unit's locality changed.

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Local)

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_isLocal"];

_unit removeEventHandler ["Killed",_unit getVariable "UVO_killedEHID"];
_unit setVariable ["UVO_killedEHID",nil];

private _EHIDs = _unit getVariable "UVO_EHIDs";
if (!isNil "_EHIDs") then {
	_EHIDs params ["_firedEHID","_firedManEHID","_hitEHID","_reloadedEHID","_localEHID",];
	_unit removeEventHandler ["Fired",_firedEHID];
	_unit removeEventHandler ["FiredMan",_FiredManEHID];
	_unit removeEventHandler ["Hit",_hitEHID];
	_unit removeEventHandler ["Reloaded",_reloadedEHID];
	_unit removeEventHandler ["Local",_localEHID];
	_unit setVariable ["UVO_EHIDs",nil];
};

// Reinitialize unit on remote machine
[_unit] remoteExec ["UVO_fnc_reinitialize",_unit];
