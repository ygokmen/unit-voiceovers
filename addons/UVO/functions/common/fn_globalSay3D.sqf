params ["_actor", "_sound"];

if (!alive _actor) exitWith {};

// Don't let the unit talk over himself
if ((_actor getVariable "UVO_unitRandomLip") || inputAction "pushToTalk" > 0) exitWith {};

// 'Say' the sound on all clients
[_actor, [_sound, UVO_option_soundsDiameter, UVO_option_soundsSamplePitch]] remoteExec ["say3D",0];

// Give some lip movement
_actor setVariable ["UVO_unitRandomLip",true];
[_actor,true] remoteExec ["setRandomLip",0];

[
	{
		_this setVariable ["UVO_unitRandomLip",false];
		[_this,false] remoteExec ["setRandomLip",0];
	},
	_actor,
	(1 + random 1)
] call CBA_fnc_waitAndExecute;
