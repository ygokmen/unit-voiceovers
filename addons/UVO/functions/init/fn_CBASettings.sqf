/*--------------------------------------------------------
Authors: Gokmen, Sceptre
CBA Settings definition function called preInit

Parameters:
Nothing

Return Value:
Nothing
----------------------------------------------------------*/
UVO_option_enableSentences = profileNamespace getVariable ["UVO_option_enableSentences", false];
UVO_option_clientEnabled = profileNamespace getVariable ["UVO_option_clientEnabled", true];
//UVO_option_proximityCheck = profileNamespace getVariable ["UVO_option_proximityCheck", true];
UVO_option_killConfirmChanceAI = profileNamespace getVariable ["UVO_option_killConfirmChanceAI", 1];
UVO_option_killConfirmChancePlayer = profileNamespace getVariable ["UVO_option_killConfirmChancePlayer", 1];
UVO_option_soundsDiameter = profileNamespace getVariable ["UVO_option_soundsDiameter", 300];
UVO_option_soundsSamplePitch = profileNamespace getVariable ["UVO_option_soundsSamplePitch", 1];
UVO_option_deathShoutsVolume = profileNamespace getVariable ["UVO_option_deathShoutsVolume", 1];
UVO_option_deathShoutsDiameter = profileNamespace getVariable ["UVO_option_deathShoutsDiameter", 300];

[
	"UVO_option_enableSentences",
	"CHECKBOX",
	["enableSentences (Default Arma chatter)","Forces default arma chatter to be enabled or disabled. Recommended off. (Default: FALSE)"],
	"Unit Voice-Over Options",
	false,
	true,
	{
		[_this] remoteExec ["enableSentences",0,true];
	}
] call CBA_Settings_fnc_init;
[
	"UVO_option_clientEnabled",
	"CHECKBOX",
	["Enabled for players","Choose whether voice-overs are used with players. (DEFAULT: TRUE)"],
	"Unit Voice-Over Options",
	true,
	true
] call CBA_Settings_fnc_init;
/*[
	"UVO_option_proximityCheck",
	"CHECKBOX",
	["Proximity Check","If enabled, sounds are only called if the unit is NOT alone. Disabling can increase performance, but units ALWAYS say stuff. (DEFAULT: TRUE)"],
	"Unit Voice-Over Options",
	true,
	true
] call CBA_Settings_fnc_init;*/
[
	"UVO_option_killConfirmChanceAI",
	"SLIDER",
	["AI kill confirmation chance","Chance that AI will give a confirmation when enemy is killed and visible. (DEFAULT: 1)"],
	"Unit Voice-Over Options",
	[0,1,1,2],
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_killConfirmChancePlayer",
	"SLIDER",
	["Player kill confirmation chance","Chance that players will give a confirmation when enemy is killed and visible. (DEFAULT: 1)"],
	"Unit Voice-Over Options",
	[0,1,1,2],
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_soundsDiameter",
	"SLIDER",
	["Voice travel diameter","Represents a sound fade-out diameter with unit at center. (DEFAULT: 300)"],
	"Unit Voice-Over Options",
	[100,500,300,0],
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_soundsSamplePitch",
	"SLIDER",
	["Voice sample pitch","Modify pitch of voice sound samples. (DEFAULT: 1)"],
	"Unit Voice-Over Options",
	[0.8,1.2,1,2],
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_deathShoutsVolume",
	"LIST",
	["Death shout volume","Changes how loud death shouts are when a unit is killed. (DEFAULT: Normal)"],
	"Unit Voice-Over Options",
	[[0,2,2.4,3,3.5,3.8],["Disabled","Very Low","Low","Normal","High","Very high"],3],
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_deathShoutsDiameter",
	"SLIDER",
	["Death shout travel diameter","Represents a sound fade-out diameter with unit at center. (DEFAULT: 300)"],
	"Unit Voice-Over Options",
	[100,500,300,0],
	true
] call CBA_Settings_fnc_init;
