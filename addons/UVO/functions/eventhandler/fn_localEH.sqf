/*--------------------------------------------------------
Authors: Sceptre
Reinitializes UVO if unit's ownership is transferred.

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Local) for more info

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_isLocal"];

(_unit getVariable "UVO_unitEHIDs") params ["_hitEHID","_firedEHID","_killedEHID","_reloadedEHID","_localEHID"];

// Remove local EH 
_unit removeEventHandler ["Hit",_hitEHID];
_unit removeEventHandler ["Fired",_firedEHID];
_unit removeEventHandler ["Killed",_killedEHID];
_unit removeEventHandler ["Reloaded",_reloadedEHID];
_unit removeEventHandler ["Local",_localEHID];
_unit setVariable ["UVO_unitEHIDs",nil];

// Reinitialize unit on remote machine
[_unit] remoteExec ["UVO_fnc_reinitialize",_unit];
