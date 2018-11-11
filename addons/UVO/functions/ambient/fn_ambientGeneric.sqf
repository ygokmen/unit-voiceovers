/*--------------------------------------------------------
Authors: Sceptre
Makes unit play a generic ambient sound, should be called via remoteExec

Parameters:
0: Unit

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit"];

if (isPlayer _unit && !UVO_option_clientEnabled) exitWith {};

if (local _unit) then {
	// Chance for cough or sniff depends on damage
	private _damage = getDammage _unit;
	private _chance = switch (true) do {
		case (_damage >= 0.6) : {0.4};
		case (_damage >= 0.3 && _damage < 0.6) : {0.25};
		default {0.1};
	};
	
	if (random 1 > _chance) exitWith {};

	// 'Say' the sound on all clients
	[_unit,[selectRandom (missionNamespace getVariable "UVO_ambientGeneric"),UVO_option_soundsDiameter,UVO_option_soundsSamplePitch]] remoteExec ["say3D",0];
};
