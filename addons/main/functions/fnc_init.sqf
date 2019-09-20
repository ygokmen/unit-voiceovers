/*--------------------------------------------------------
UVO_fnc_init
Authors: Sceptre

Initializes UVO on units with defined nationality,
accounting for CBA settings

Parameters:
0: Unit <OBJECT>
1: Nationality <STRING>

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params [["_unit",objNull,[objNull]],["_nationality","",[""]]];

if (!isNull _unit && {local _unit}) then {
	if (isNil {_unit getVariable "UVO_requiredEHIDs"}) then {
		private _killedEHID = _unit addEventhandler ["Killed",{_this call FUNC(killedEH);}];
		private _firedManEHID = _unit addEventhandler ["FiredMan",{_this call FUNC(firedManEH);}];
		private _localEHID = _unit addEventhandler ["Local",{_this call FUNC(localEH);}];
		_unit setVariable ["UVO_requiredEHIDs",[_killedEHID,_firedManEHID,_localEHID]];
		_unit setVariable ["UVO_suppressingBuffer",0];
		_unit setVariable ["UVO_suppressedBuffer",0];
	};

	if (!isNil "UVO_customNationalities") then {
		private _validNationalities = UVO_customNationalities select {(_x # 0) == faction _unit};

		if !(_validNationalities isEqualTo []) then {
			_nationality = _validNationalities # 0 # 1;
		};
	};

	private _enabled = switch (_nationality) do {
		case "EAST" : {UVO_option_enableUVOEast};
		case "GUER" : {UVO_option_enableUVOGuer};
		case "WEST" : {UVO_option_enableUVOWest};
		default {missionNamespace getVariable [format ["UVO_option_enableUVOCustom_%1",_nationality],true]};
	};

	if (_enabled) then {
		_unit setVariable ["UVO_nationality",_nationality,true];
		_unit setVariable ["UVO_allowDeathShouts",true,true];

		if (isNil {_unit getVariable "UVO_EHIDs"}) then {
			private _firedEHID = _unit addeventhandler ["Fired",{_this call FUNC(firedEH);}];
			private _hitEHID = _unit addEventHandler ["Hit",{_this call FUNC(hitEH);}];
			private _reloadedEHID = _unit addEventhandler ["Reloaded",{_this call FUNC(reloadedEH);}];
			_unit setVariable ["UVO_EHIDs",[_firedEHID,_hitEHID,_reloadedEHID]];
		};
	} else {
		_unit setVariable ["UVO_allowDeathShouts",false,true];
	};
};

nil
