/*--------------------------------------------------------
Authors: Sceptre
Removes local event handlers and calls for reinitialization on remote machine when unit's locality changed.

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Local)

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_isLocal"];

(_unit getVariable "UVO_unitEHIDs") params ["_firedEHID","_hitEHID","_killedEHID","_localEHID","_reloadedEHID"];

// Remove local EH
_unit removeEventHandler ["Fired",_firedEHID];
_unit removeEventHandler ["Hit",_hitEHID];
_unit removeEventHandler ["Killed",_killedEHID];
_unit removeEventHandler ["Local",_localEHID];
_unit removeEventHandler ["Reloaded",_reloadedEHID];
_unit setVariable ["UVO_unitEHIDs",nil];

// Reinitialize unit on remote machine
[_unit] remoteExec ["UVO_fnc_reinitialize",_unit];
