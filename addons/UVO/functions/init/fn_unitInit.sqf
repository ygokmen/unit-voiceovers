/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Class based init event handler script
Can be used to enable UVO on a unit that has had UVO disabled, but should be called via remoteExec

Parameters:
0: The spawned unit <OBJECT>
1: Default nationality applied to unit <STRING>

Return Value:
Nothing

Examples:
[_myUnit,"WEST"] remoteExec ["UVO_fnc_unitInit",_myUnit];
----------------------------------------------------------*/
params ["_unit","_defaultNationality"];

// UVO is handled where unit is local
if (local _unit) then {
	// Flag the unit's group to be used with ambientRadio
	if (UVO_option_ambientRadioEnabled) then {
		(group _unit) setVariable ["UVO_groupEnable",true,true];
	};
	
	if ((UVO_option_enableUVOEast && _unit isKindOf "SoldierEB") || {(UVO_option_enableUVOGuer && _unit isKindOf "SoldierGB") || {(UVO_option_enableUVOWest && _unit isKindOf "SoldierWB")}}) then {
		// Set unit nationality
		if (!isNil "UVO_customNationalities") then {
			private _customNationality = UVO_customNationalities select {(_x # 0) == faction _unit};

			if !(_customNationality isEqualTo []) then {
				_unit setVariable ["UVO_unitNationality",(_customNationality # 0 # 1),true];
			} else {
				_unit setVariable ["UVO_unitNationality",_defaultNationality,true];
			};
		} else {
			_unit setVariable ["UVO_unitNationality",_defaultNationality,true];
		};
		
		// Make it so unit can talk with UVO_fnc_globalSay3D
		_unit setVariable ["UVO_unitTalking",false];

		// Add necessary Event Handlers
		private _firedEHID = _unit addeventhandler ["Fired",{_this call UVO_fnc_firedEH}];
		private _hitEHID = _unit addEventHandler ["Hit",{_this call UVO_fnc_hitEH}];
		private _killedEHID = _unit addEventhandler ["Killed",{_this call UVO_fnc_killedEH}];
		private _localEHID = _unit addEventhandler ["Local",{_this call UVO_fnc_localEH}];
		private _reloadedEHID = _unit addEventhandler ["Reloaded",{_this call UVO_fnc_reloadedEH}];
		_unit setVariable ["UVO_unitEHIDs",[_firedEHID,_hitEHID,_killedEHID,_localEHID,_reloadedEHID]];
	} else {
		// Killed EH so kill confirmations work
		private _killedEHID = _unit addEventhandler ["Killed",{_this call UVO_fnc_killedEH}];
	};
};
