/*--------------------------------------------------------
Authors: Gokmen, Sceptre
PreInit CBA Settings function
----------------------------------------------------------*/
[
	"UVO_option_clientEnabled","CHECKBOX",
	["Enable for players","Enable voice-overs for players. (DEFAULT: TRUE)"],
	"Unit Voice-Over Options",
	true,true
] call CBA_Settings_fnc_init;
[
	"UVO_option_killConfirmChanceAI","SLIDER",
	["AI kill confirmation chance","Chance AI will give a confirmation when an enemy is killed and visible. (DEFAULT: 1)"],
	"Unit Voice-Over Options",
	[0,1,1,2],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_killConfirmChancePlayer","SLIDER",
	["Player kill confirmation chance","Chance players will give a confirmation when an enemy is killed and visible. (DEFAULT: 1)"],
	"Unit Voice-Over Options",
	[0,1,1,2],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_maxDistVoices","SLIDER",
	["Voice max hearing distance","Sound fade-out distance. (DEFAULT: 300)"],
	"Unit Voice-Over Options",
	[50,1000,300,0],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_soundsSamplePitch","SLIDER",
	["Voice sample pitch","Modify pitch of voice sound samples. (DEFAULT: 1)"],
	"Unit Voice-Over Options",
	[0.8,1.2,1,2],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_deathShoutsVolume","SLIDER",
	["Death shout volume","Changes how loud death shouts are when a unit is killed. (DEFAULT: 3)"],
	"Unit Voice-Over Options",
	[0,20,3,1],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_maxDistDeathShouts","SLIDER",
	["Death shout max hearing distance","Sound fade-out distance. (DEFAULT: 300)"],
	"Unit Voice-Over Options",
	[50,1000,300,0],true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableSentencesEast","CHECKBOX",
	["EAST - Default chatter/voices","Allows default Arma voices for specified nationality (inherits from SoldierEB class). (Default: TRUE)"],
	["Unit Voice-Over Options","Nationality/Side Settings"],
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableSentencesGuer","CHECKBOX",
	["GUER - Default chatter/voices","Allows default Arma voices for specified nationality (inherits from SoldierGB class). (Default: TRUE)"],
	["Unit Voice-Over Options","Nationality/Side Settings"],
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableSentencesWest","CHECKBOX",
	["WEST - Default chatter/voices","Allows default Arma voices for specified nationality (inherits from SoldierWB class). (Default: TRUE)"],
	["Unit Voice-Over Options","Nationality/Side Settings"],
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableUVOEast","CHECKBOX",
	["EAST - Enable UVO","Enables unit voice-overs for specified nationality (inherits from SoldierEB class). (Default: TRUE)"],
	["Unit Voice-Over Options","Nationality/Side Settings"],
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableUVOGuer","CHECKBOX",
	["GUER - Enable UVO","Enables unit voice-overs for specified nationality (inherits from SoldierGB class). (Default: TRUE)"],
	["Unit Voice-Over Options","Nationality/Side Settings"],
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	"UVO_option_enableUVOWest","CHECKBOX",
	["WEST - Enable UVO","Enables unit voice-overs for specified nationality (inherits from SoldierWB class). (Default: TRUE)"],
	["Unit Voice-Over Options","Nationality/Side Settings"],
	true,true,{},true
] call CBA_Settings_fnc_init;
