/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Globally executes say3D with lip movement functionality

Parameters:
0: Talking unit <OBJECT>
1: Sound class <STRING>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_sound"];

// Don't let dead or unconscious units talk
if (!alive _unit || (_unit getVariable ["ACE_isUnconscious",false])) exitWith {};

// Stop if unit is in stealth mode (until we have whisper sound samples)
if (behaviour _unit == "STEALTH") exitWith {};

// Don't let the unit talk over himself
if ((_unit getVariable "UVO_unitTalking") || inputAction "pushToTalk" > 0) exitWith {};
_unit setVariable ["UVO_unitTalking",true];

// 'Say' the sound on all clients
[_unit,[_sound,UVO_option_soundsDiameter,UVO_option_soundsSamplePitch]] remoteExec ["say3D",0];

// Give some lip movement and let the unit talk again
[_unit,true] remoteExec ["setRandomLip",0];
[
	{
		[_this,false] remoteExec ["setRandomLip",0];
		_this setVariable ["UVO_unitTalking",false];
	},
	_unit,
	(1 + random 1)
] call CBA_fnc_waitAndExecute;
