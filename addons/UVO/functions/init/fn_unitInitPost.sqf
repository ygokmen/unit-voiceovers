/*--------------------------------------------------------
Authors: Sceptre
Unit initPost function
(Disables sentences if set in CBA settings)

Parameters:
0: Unit <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

if (local _unit) then {
	_unit setVariable ["UVO_defaultVoice",speaker _unit,true];

	if (!UVO_option_enableSentencesEast && _unit isKindOf "SoldierEB" || !UVO_option_enableSentencesGuer && _unit isKindOf "SoldierGB" || !UVO_option_enableSentencesWest && _unit isKindOf "SoldierWB") then {
		[_unit,false] remoteExec ["UVO_fnc_enableSentences",2];
	};
};
