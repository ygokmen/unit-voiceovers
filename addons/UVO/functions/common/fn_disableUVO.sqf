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
		_unitEHIDs params ["_hitEHID","_firedEHID","_killedEHID","_reloadedEHID","_localEHID"];

		// Remove event handlers
		_unit removeEventHandler ["Hit",_hitEHID];
		_unit removeEventHandler ["Fired",_firedEHID];
		_unit removeEventHandler ["Killed",_killedEHID];
		_unit removeEventHandler ["Reloaded",_reloadedEHID];
		_unit removeEventHandler ["Local",_localEHID];

		// Remove variables
		_unit setVariable ["UVO_unitRandomLip",nil];
		_unit setVariable ["UVO_unitNationality",nil,true];
		_unit setVariable ["UVO_unitEHIDs",nil,true];

		diag_log format["UVO INFO: UVO_fnc_disableUVO: %1 REMOVED FROM UVO FRAMEWORK",_unit];
	} else {
		diag_log format["UVO INFO: UVO_fnc_disableUVO: %1 SHOULD ALREADY BE REMOVED FROM UVO FRAMEWORK",_unit];
	};
} else {
	diag_log format["UVO ERROR: UVO_fnc_disableUVO: %1 NOT LOCAL",_unit];
};
