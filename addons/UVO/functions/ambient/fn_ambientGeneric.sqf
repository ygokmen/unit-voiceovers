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
	// Chance to do anything
	if (random 1 > 0.25) exitWith {};

	// Do it
	[_unit,selectRandom (missionNamespace getVariable "UVO_ambientGeneric")] call UVO_fnc_globalSay3D;
};
