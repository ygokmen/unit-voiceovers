/*--------------------------------------------------------
Authors: Gokmen, Sceptre
CBA Settings function called via XEH preInit
----------------------------------------------------------*/
UVO_option_clientEnabled = profileNamespace getVariable ["UVO_option_clientEnabled",true];
UVO_option_ambientGenericEnabled = profileNamespace getVariable ["UVO_option_ambientGenericEnabled",true];
UVO_option_ambientRadioEnabled = profileNamespace getVariable ["UVO_option_ambientRadioEnabled",true];
UVO_option_ambientRadioSetting = profileNamespace getVariable ["UVO_option_ambientRadioSetting",2];
UVO_option_killConfirmChanceAI = profileNamespace getVariable ["UVO_option_killConfirmChanceAI",1];
UVO_option_killConfirmChancePlayer = profileNamespace getVariable ["UVO_option_killConfirmChancePlayer",1];
UVO_option_soundsDiameter = profileNamespace getVariable ["UVO_option_soundsDiameter",300];
UVO_option_soundsSamplePitch = profileNamespace getVariable ["UVO_option_soundsSamplePitch",1];
UVO_option_deathShoutsVolume = profileNamespace getVariable ["UVO_option_deathShoutsVolume",2.9];
UVO_option_deathShoutsDiameter = profileNamespace getVariable ["UVO_option_deathShoutsDiameter",300];
UVO_option_enableSentencesEast = profileNamespace getVariable ["UVO_option_enableSentencesEast",false];
UVO_option_enableSentencesGuer = profileNamespace getVariable ["UVO_option_enableSentencesGuer",false];
UVO_option_enableSentencesWest = profileNamespace getVariable ["UVO_option_enableSentencesWest",false];
UVO_option_enableUVOEast = profileNamespace getVariable ["UVO_option_enableUVOEast",true];
UVO_option_enableUVOGuer = profileNamespace getVariable ["UVO_option_enableUVOGuer",true];
UVO_option_enableUVOWest = profileNamespace getVariable ["UVO_option_enableUVOWest",true];

[
	"UVO_option_clientEnabled",
	"CHECKBOX",
	["Enabled for players","Choose whether voice-overs are used with players. (DEFAULT: TRUE)"],
	"Unit Voice-Over Options",
	true,
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_ambientGenericEnabled",
	"CHECKBOX",
	["Ambient generic sounds","When enabled, units will cough/sniff. Mission restart required. (DEFAULT: TRUE)"],
	"Unit Voice-Over Options",
	true,
	true,
	{},
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_ambientRadioEnabled",
	"CHECKBOX",
	["Ambient radio transmissions","When enabled, random radio transmissions can be heard on units. Runs on a per group basis. Mission restart required. (DEFAULT: TRUE)"],
	"Unit Voice-Over Options",
	true,
	true,
	{},
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_ambientRadioSetting",
	"LIST",
	["Ambient radio group setting","Choose who radio transmissions will be able play on. (DEFAULT: 'Only group leaders')"],
	"Unit Voice-Over Options",
	[[0,1,2,3],["All AI + Players","Only AI","Only group leaders","Only AI group leaders"],2],
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_ambientRadioChance",
	"SLIDER",
	["Ambient radio chance","Chance a radio transmission will play after a random interval has elapsed. (DEFAULT: 0.5)"],
	"Unit Voice-Over Options",
	[0.1,1,0.5,2],
	true
] call CBA_Settings_fnc_init;
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
[
	"UVO_option_enableSentencesEast",
	"CHECKBOX",
	["EAST - Default chatter","Allows default Arma voices for specified side (inherits from SoldierEB class). (Default: FALSE)"],
	"Unit Voice-Over Options",
	false,
	true,
	{},
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableSentencesGuer",
	"CHECKBOX",
	["GUER - Default chatter","Allows default Arma voices for specified side (inherits from SoldierGB class). (Default: FALSE)"],
	"Unit Voice-Over Options",
	false,
	true,
	{},
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableSentencesWest",
	"CHECKBOX",
	["WEST - Default chatter","Allows default Arma voices for specified side (inherits from SoldierWB class). (Default: FALSE)"],
	"Unit Voice-Over Options",
	false,
	true,
	{},
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableUVOEast",
	"CHECKBOX",
	["EAST - Enable UVO","Enables unit voice-overs for specified side (inherits from SoldierEB class). (Default: TRUE)"],
	"Unit Voice-Over Options",
	true,
	true,
	{},
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableUVOGuer",
	"CHECKBOX",
	["GUER - Enable UVO","Enables unit voice-overs for specified side (inherits from SoldierGB class). (Default: TRUE)"],
	"Unit Voice-Over Options",
	true,
	true,
	{},
	true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableUVOWest",
	"CHECKBOX",
	["WEST - Enable UVO","Enables unit voice-overs for specified side (inherits from SoldierWB class). (Default: TRUE)"],
	"Unit Voice-Over Options",
	true,
	true,
	{},
	true
] call CBA_Settings_fnc_init;
