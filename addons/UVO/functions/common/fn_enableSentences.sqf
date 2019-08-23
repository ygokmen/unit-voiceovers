/*--------------------------------------------------------
UVO_fnc_enableSentences
Authors: Sceptre

Enables/Disables default voice

Parameters:
0: Unit <OBJECT>
1: Enable/disable default voice <BOOL>

Public:
No

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_enable"];

if (_enable) then {
	private _voice = _unit getVariable "UVO_defaultVoice";
	[_unit,_voice] remoteExec ["setSpeaker",0,_unit];
} else {
	[_unit,"NoVoice"] remoteExec ["setSpeaker",0,_unit];
};
