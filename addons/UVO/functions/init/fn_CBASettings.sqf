/*--------------------------------------------------------
Authors: Gokmen, Sceptre
PreInit CBA Settings function
----------------------------------------------------------*/
[
	"UVO_option_clientEnabled",
	"CHECKBOX",
	["Enabled for players","Enable voice-overs for players. (DEFAULT: TRUE)"],
	"Unit Voice-Over Options",
	true,true
] call CBA_Settings_fnc_init;
[
	"UVO_option_killConfirmChanceAI",
	"SLIDER",
	["AI kill confirmation chance","Chance that AI will give a confirmation when enemy is killed and visible. (DEFAULT: 1)"],
	"Unit Voice-Over Options",
	[0,1,1,2],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_killConfirmChancePlayer",
	"SLIDER",
	["Player kill confirmation chance","Chance that players will give a confirmation when enemy is killed and visible. (DEFAULT: 1)"],
	"Unit Voice-Over Options",
	[0,1,1,2],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_soundsDiameter",
	"SLIDER",
	["Voice travel diameter","Represents a sound fade-out diameter with unit at center. (DEFAULT: 300)"],
	"Unit Voice-Over Options",
	[100,500,300,0],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_soundsSamplePitch",
	"SLIDER",
	["Voice sample pitch","Modify pitch of voice sound samples. (DEFAULT: 1)"],
	"Unit Voice-Over Options",
	[0.8,1.2,1,2],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_deathShoutsVolume",
	"LIST",
	["Death shout volume","Changes how loud death shouts are when a unit is killed. (DEFAULT: Normal)"],
	"Unit Voice-Over Options",
	[[0,2,2.4,3,3.5,3.8,6],["Disabled","Very Low","Low","Normal","High","Very high","Extreme"],3],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_deathShoutsDiameter",
	"SLIDER",
	["Death shout travel diameter","Represents a sound fade-out diameter with unit at center. (DEFAULT: 300)"],
	"Unit Voice-Over Options",
	[100,500,300,0],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableSentencesEast",
	"CHECKBOX",
	["EAST - Default chatter","Allows default Arma voices for specified nationality (inherits from SoldierEB class). (Default: TRUE)"],
	"Unit Voice-Over Options",
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableSentencesGuer",
	"CHECKBOX",
	["GUER - Default chatter","Allows default Arma voices for specified nationality (inherits from SoldierGB class). (Default: TRUE)"],
	"Unit Voice-Over Options",
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableSentencesWest",
	"CHECKBOX",
	["WEST - Default chatter","Allows default Arma voices for specified nationality (inherits from SoldierWB class). (Default: TRUE)"],
	"Unit Voice-Over Options",
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableUVOEast",
	"CHECKBOX",
	["EAST - Enable UVO","Enables unit voice-overs for specified nationality (inherits from SoldierEB class). (Default: TRUE)"],
	"Unit Voice-Over Options",
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableUVOGuer",
	"CHECKBOX",
	["GUER - Enable UVO","Enables unit voice-overs for specified nationality (inherits from SoldierGB class). (Default: TRUE)"],
	"Unit Voice-Over Options",
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableUVOWest",
	"CHECKBOX",
	["WEST - Enable UVO","Enables unit voice-overs for specified nationality (inherits from SoldierWB class). (Default: TRUE)"],
	"Unit Voice-Over Options",
	true,true,{},true
] call CBA_Settings_fnc_init;
