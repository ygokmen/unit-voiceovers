/*--------------------------------------------------------
UVO_fnc_addUVO
Authors: Gökmen, Sceptre

Adds unit voice-overs to a unit with a defined nationality

Parameters:
0: Unit <OBJECT>
1: Nationality <STRING>

Public:
Yes

Return Value:
Nothing

Examples:
["SoldierWB","initPost",{[_this # 0,"WEST"] call UVO_main_fnc_addUVO}] call CBA_fnc_addClassEventHandler;
----------------------------------------------------------*/
params [["_unit",objNull,[objNull]],["_nationality","",[""]]];

// UVO should only be handled where unit is local
if (!isNull _unit && {local _unit}) then {
	if (isNil {_unit getVariable "UVO_requiredEHIDs"}) then {
		private _killedEHID = _unit addEventhandler ["Killed",{_this call FUNC(killedEH);}];
		private _firedManEHID = _unit addEventhandler ["FiredMan",{_this call FUNC(firedManEH);}];
		private _localEHID = _unit addEventhandler ["Local",{_this call FUNC(localEH);}];
		_unit setVariable ["UVO_requiredEHIDs",[_killedEHID,_firedManEHID,_localEHID]];
		_unit setVariable ["UVO_suppressingBuffer",0];
		_unit setVariable ["UVO_suppressedBuffer",0];
	};

	if (toUpper _nationality in ["EAST","GUER","WEST"]) then {
		_unit setVariable ["UVO_nationality",_nationality,true];
	} else {
		if (!isNil "UVO_customNationalities") then {
			private _validNationalities = UVO_customNationalities select {(_x # 0) == faction _unit};

			if !(_validNationalities isEqualTo []) then {
				_unit setVariable ["UVO_nationality",_validNationalities # 0 # 1,true];
			} else {
				_unit setVariable ["UVO_nationality",_nationality,true];
			};
		};
	};

	_unit setVariable ["UVO_allowDeathShouts",true,true];

	if (isNil {_unit getVariable "UVO_EHIDs"} && !isNil {_unit getVariable "UVO_nationality"}) then {
		private _firedEHID = _unit addeventhandler ["Fired",{_this call FUNC(firedEH);}];
		private _hitEHID = _unit addEventHandler ["Hit",{_this call FUNC(hitEH);}];
		private _reloadedEHID = _unit addEventhandler ["Reloaded",{_this call FUNC(reloadedEH);}];
		_unit setVariable ["UVO_EHIDs",[_firedEHID,_hitEHID,_reloadedEHID]];
	};
};

nil
