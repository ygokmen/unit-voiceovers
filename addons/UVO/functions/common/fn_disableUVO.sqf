/*--------------------------------------------------------
UVO_fnc_disableUVO
Authors: Sceptre

Disable voice-overs for a unit. Should be called post-init,
and where unit is local.

Parameters:
0: Unit <OBJECT>

Public:
Yes

Return Value:
Nothing

Examples:
[_unit] remoteExec ["UVO_fnc_disableUVO",_unit];
["SoldierWB","initPost",{[_this # 0] call UVO_fnc_disableUVO}] call CBA_fnc_addClassEventHandler;
----------------------------------------------------------*/
params [["_unit",objNull,[objNull]]];

if (local _unit) then {
	private _EHIDs = _unit getVariable "UVO_EHIDs";
	if (!isNil "_EHIDs") then {
		_EHIDs params ["_firedEHID","_firedManEHID","_hitEHID","_reloadedEHID","_localEHID"];
		_unit removeEventHandler ["Fired",_firedEHID];
		_unit removeEventHandler ["FiredMan",_firedManEHID];
		_unit removeEventHandler ["Hit",_hitEHID];
		_unit removeEventHandler ["Reloaded",_reloadedEHID];
		_unit removeEventHandler ["Local",_localEHID];
		_unit setVariable ["UVO_EHIDs",nil];
		_unit setVariable ["UVO_talking",nil];
		_unit setVariable ["UVO_nationality",nil,true];
		_unit setVariable ["UVO_defaultVoice",nil,true];
		_unit setVariable ["UVO_suppressTimer",nil];
		_unit setVariable ["UVO_suppressedTimer",nil];
		_unit setVariable ["UVO_allowDeathShouts",false,true]; // Disable death shouts

		diag_log format["UVO INFO: UVO_fnc_disableUVO: %1 REMOVED FROM UVO FRAMEWORK",_unit];
	} else {
		diag_log format["UVO INFO: UVO_fnc_disableUVO: %1 SHOULD ALREADY BE REMOVED FROM UVO FRAMEWORK",_unit];
	};
} else {
	diag_log format["UVO ERROR: UVO_fnc_disableUVO: %1 NOT LOCAL",_unit];
};

nil
