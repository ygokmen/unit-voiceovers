/*--------------------------------------------------------
Authors: Sceptre
Enables/Disables default voice

Parameters:
0: True - Adds default voice. False - Removes default voice <BOOL>
1: Unit <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_switch","_unit"];

if (_switch) then {
	private _voice = _unit getVariable "UVO_unitDefaultVoice";
	[_unit,_voice] remoteExec ["setSpeaker",0];
} else {
	[_unit,"NoVoice"] remoteExec ["setSpeaker",0];
};
