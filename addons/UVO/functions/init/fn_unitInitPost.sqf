/*--------------------------------------------------------
Authors: Sceptre
Class based initPost event handler script

Parameters:
0: Unit <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

if (local _unit) then {
	_unit setVariable ["UVO_unitDefaultVoice",(speaker _unit),true];

	if ((!UVO_option_enableSentencesEast && _unit isKindOf "SoldierEB") || {(!UVO_option_enableSentencesGuer && _unit isKindOf "SoldierGB") || {(!UVO_option_enableSentencesWest && _unit isKindOf "SoldierWB")}}) then {
		[false,_unit] remoteExec ["UVO_fnc_setVoice",2];
	};
};
