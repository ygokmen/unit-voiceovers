/*--------------------------------------------------------
UVO_fnc_unitInitPost
Authors: Sceptre

Disables sentences if set in CBA settings

Parameters:
0: Unit <OBJECT>

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

if (local _unit) then {
	_unit setVariable ["UVO_defaultVoice",speaker _unit,true];

	private _nationality = _unit getVariable "UVO_nationality";
	private _enabled = switch (_nationality) do {
		case "EAST" : {UVO_option_enableSentencesEast};
		case "GUER" : {UVO_option_enableSentencesGuer};
		case "WEST" : {UVO_option_enableSentencesWest};
		default {missionNamespace getVariable [format ["UVO_option_enableSentencesCustom_%1",_nationality],true]};
	};

	if (!_enabled) then {
		[_unit,false] remoteExec [QFUNC(enableSentences),2];
	};
};
