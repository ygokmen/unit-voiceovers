/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Adds unit voice-overs to a unit with a defined nationality

Parameters:
0: The spawned unit <OBJECT>
1: Nationality to be applied <STRING>

Return Value:
Nothing
----------------------------------------------------------*/
params [["_unit",objNull,[objNull]],["_nationality","",[""]]];

// UVO should only be handled where unit is local
if (!isNull _unit && {local _unit}) then {
	// Always add killed event handler so kill confirmations work
	if (isNil {_unit getVariable "UVO_killedEHID"}) then {
		private _killedEHID = _unit addEventhandler ["Killed",{_this call UVO_fnc_killedEH;}];
		_unit setVariable ["UVO_killedEHID",_killedEHID];
	};

	// Stop here if default nationality is disabled
	private _allowed =
		UVO_option_enableUVOEast && _unit isKindOf "SoldierEB" ||
		UVO_option_enableUVOGuer && _unit isKindOf "SoldierGB" ||
		UVO_option_enableUVOWest && _unit isKindOf "SoldierWB";

	if ((toUpper _nationality) in ["EAST","GUER","WEST"] && !_allowed) exitWith {};

	if (isNil {_unit getVariable "UVO_EHIDs"}) then {
		// Set unit nationality
		if (!isNil "UVO_customNationalities") then {
			private _customNationality = UVO_customNationalities select {(_x # 0) == faction _unit};

			if !(_customNationality isEqualTo []) then {
				_unit setVariable ["UVO_nationality",_customNationality # 0 # 1,true];
			} else {
				_unit setVariable ["UVO_nationality",_nationality,true];
			};
		} else {
			_unit setVariable ["UVO_nationality",_nationality,true];
		};

		// Add necessary event handlers
		private _firedEHID = _unit addeventhandler ["Fired",{_this call UVO_fnc_firedEH;}];
		private _firedManEHID = _unit addEventhandler ["FiredMan",{_this call UVO_fnc_firedManEH;}];
		private _hitEHID = _unit addEventHandler ["Hit",{_this call UVO_fnc_hitEH;}];
		private _reloadedEHID = _unit addEventhandler ["Reloaded",{_this call UVO_fnc_reloadedEH;}];
		private _localEHID = _unit addEventhandler ["Local",{_this call UVO_fnc_localEH;}];
		// Initialize variables
		_unit setVariable ["UVO_EHIDs",[_firedEHID,_firedManEHID,_hitEHID,_reloadedEHID,_localEHID]];
		_unit setVariable ["UVO_suppressTimer",0];
		_unit setVariable ["UVO_suppressedTimer",0];
		_unit setVariable ["UVO_allowDeathShouts",true,true];
	};
};
