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
		private _killedEHID = _unit addEventhandler ["Killed",{_this call UVO_fnc_killedEH;}];
		private _firedManEHID = _unit addEventhandler ["FiredMan",{_this call UVO_fnc_firedManEH;}];
		private _localEHID = _unit addEventhandler ["Local",{_this call UVO_fnc_localEH;}];
		_unit setVariable ["UVO_requiredEHIDs",[_killedEHID,_firedManEHID,_localEHID]];
		_unit setVariable ["UVO_suppressingBuffer",0];
		_unit setVariable ["UVO_suppressedBuffer",0];
	};

	private _enabled = switch (_nationality) do {
		case "EAST" : {UVO_option_enableUVOEast};
		case "GUER" : {UVO_option_enableUVOGuer};
		case "WEST" : {UVO_option_enableUVOWest};
		default {true};
	};

	if (_enabled) then {
		_unit setVariable ["UVO_allowDeathShouts",true,true];
		_unit setVariable ["UVO_nationality",_nationality,true];

		if (isNil {_unit getVariable "UVO_EHIDs"}) then {
			private _firedEHID = _unit addeventhandler ["Fired",{_this call UVO_fnc_firedEH;}];
			private _hitEHID = _unit addEventHandler ["Hit",{_this call UVO_fnc_hitEH;}];
			private _reloadedEHID = _unit addEventhandler ["Reloaded",{_this call UVO_fnc_reloadedEH;}];
			_unit setVariable ["UVO_EHIDs",[_firedEHID,_hitEHID,_reloadedEHID]];
			_unit setVariable ["UVO_allowDeathShouts",true,true];
		};
	} else {
		_unit setVariable ["UVO_allowDeathShouts",false,true];
	};
};

nil
