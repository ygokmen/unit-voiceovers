/*--------------------------------------------------------
Authors: Sceptre
Disable voice-overs for a unit. Should be called via remoteExec.

Parameters:
0: Unit to disable UVO on <OBJECT>

Return Value:
Nothing

Example:
[_myUnit] remoteExec ["UVO_fnc_disableUVO",_myUnit];
----------------------------------------------------------*/
params ["_unit"];

if (local _unit) then {
	private _unitEHIDs = _unit getVariable "UVO_unitEHIDs";

	if (!isNil "_unitEHIDs") then {
		_unitEHIDs params ["_firedEHID","_hitEHID","_killedEHID","_localEHID","_reloadedEHID"];

		// Remove local EH
		_unit removeEventHandler ["Fired",_firedEHID];
		_unit removeEventHandler ["Hit",_hitEHID];
		_unit removeEventHandler ["Killed",_killedEHID];
		_unit removeEventHandler ["Local",_localEHID];
		_unit removeEventHandler ["Reloaded",_reloadedEHID];
		_unit setVariable ["UVO_unitEHIDs",nil];
		_unit setVariable ["UVO_unitRandomLip",nil];
		_unit setVariable ["UVO_unitNationality",nil,true];

		diag_log format["UVO INFO: UVO_fnc_disableUVO: %1 REMOVED FROM UVO FRAMEWORK",_unit];
	} else {
		diag_log format["UVO INFO: UVO_fnc_disableUVO: %1 SHOULD ALREADY BE REMOVED FROM UVO FRAMEWORK",_unit];
	};
} else {
	diag_log format["UVO ERROR: UVO_fnc_disableUVO: %1 NOT LOCAL - FUNCTION SHOULD BE CALLED VIA REMOTEXEC WITH UNIT AS TARGET",_unit];
};
