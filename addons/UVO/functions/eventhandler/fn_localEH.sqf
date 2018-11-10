/*--------------------------------------------------------
Authors: Sceptre
Reinitializes UVO if unit's ownership is transferred.

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Local)

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_isLocal"];

(_unit getVariable "UVO_unitEHIDs") params ["_animChangedEHID","_firedEHID","_hitEHID","_killedEHID","_localEHID","_reloadedEHID"];

// Remove local EH
_unit removeEventHandler ["AnimChanged",_animChangedEHID];
_unit removeEventHandler ["Fired",_firedEHID];
_unit removeEventHandler ["Hit",_hitEHID];
_unit removeEventHandler ["Killed",_killedEHID];
_unit removeEventHandler ["Local",_localEHID];
_unit removeEventHandler ["Reloaded",_reloadedEHID];
_unit setVariable ["UVO_unitEHIDs",nil];

// Reinitialize unit on remote machine
[_unit] remoteExec ["UVO_fnc_reinitialize",_unit];
