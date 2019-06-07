/*-----------------------------------------------------------------------------------------------//
Authors: Sceptre
CBA Settings function
//-----------------------------------------------------------------------------------------------*/
[
	"UAS_option_disableOnPlayers","CHECKBOX",
	["Disable on players","Disables all ambient SFX for players. (DEFAULT: FALSE)"],
	"Unit Ambient SFX Options",
	false,true
] call CBA_settings_fnc_init;
//-----------------------------------------------------------------------------------------------//
// Radio
//-----------------------------------------------------------------------------------------------//
[
	"UAS_option_enableRadio","CHECKBOX",
	["Radio - Enable","Enables ambient radios, runs on a per-group basis. (DEFAULT: TRUE)"],
	["Unit Ambient SFX Options","Ambient Radio"],
	true,true,{},true
] call CBA_settings_fnc_init;
[
	"UAS_option_disableRadioOnPlayers","CHECKBOX",
	["Radio - Disable on players","Disables ambient radio sounds for players. (DEFAULT: FALSE)"],
	["Unit Ambient SFX Options","Ambient Radio"],
	false,true
] call CBA_settings_fnc_init;
[
	"UAS_option_minIntervalRadio","SLIDER",
	["Radio - Min Interval","Mininum interval time in seconds. (DEFAULT: 20)"],
	["Unit Ambient SFX Options","Ambient Radio"],
	[15,300,20,0],true
] call CBA_settings_fnc_init;
[
	"UAS_option_intMultiplierRadio","SLIDER",
	["Radio - Random Multiplier","A random time is generated from the product of Min Interval times this number, then added to the minimum. (DEFAULT: 2.5)"],
	["Unit Ambient SFX Options","Ambient Radio"],
	[0,10,2.5,2],true
] call CBA_settings_fnc_init;
[
	"UAS_option_chanceRadio","SLIDER",
	["Radio - Chance","Chance sound will play after random interval has elapsed. (DEFAULT: 0.5)"],
	["Unit Ambient SFX Options","Ambient Radio"],
	[0,1,0.5,2],true
] call CBA_settings_fnc_init;
[
	"UAS_option_groupRadio","LIST",
	["Radio - Group Radio","Change which unit the radio sounds will play on. (DEFAULT: Leader only)"],
	["Unit Ambient SFX Options","Ambient Radio"],
	[[0,1,2],["Leader only","Roll the dice","Units with 'UAS_radioOperator' variable"],0],true
] call CBA_settings_fnc_init;
[
	"UAS_option_maxDistRadio","SLIDER",
	["Radio - Max Hearing Distance","Sound fade-out distance. (DEFAULT: 250)"],
	["Unit Ambient SFX Options","Ambient Radio"],
	[50,1000,250,0],true
] call CBA_settings_fnc_init;
[
	"UAS_option_maxDistRadioInVehicle","SLIDER",
	["Radio - Max Hearing Distance In Vehicle","Sound fade-out distance when inside a vehicle. (DEFAULT: 100)"],
	["Unit Ambient SFX Options","Ambient Radio"],
	[50,1000,100,0],true
] call CBA_settings_fnc_init;
//-----------------------------------------------------------------------------------------------//
// Cough
//-----------------------------------------------------------------------------------------------//
[
	"UAS_option_enableCough","CHECKBOX",
	["Cough - Enable","Enables ambient coughing. (DEFAULT: TRUE)"],
	["Unit Ambient SFX Options","Coughing"],
	true,true,{},true
] call CBA_settings_fnc_init;
[
	"UAS_option_minIntervalCough","SLIDER",
	["Cough - Min Interval","Mininum random interval time in seconds. (Gaussian distribution) (DEFAULT: 60)"],
	["Unit Ambient SFX Options","Coughing"],
	[15,300,60,0],true
] call CBA_settings_fnc_init;
[
	"UAS_option_intMultiplierCough","SLIDER",
	["Cough - Random Multiplier","A random time is generated from the product of Min Interval times this number, then added to the minimum. (DEFAULT: 2.5)"],
	["Unit Ambient SFX Options","Coughing"],
	[0,10,2.5,2],true
] call CBA_settings_fnc_init;
[
	"UAS_option_chanceCough","SLIDER",
	["Cough - Chance","Chance sound will play after random interval has elapsed. Cough chance increases with unit damage. (DEFAULT: 0.1)"],
	["Unit Ambient SFX Options","Coughing"],
	[0,1,0.1,2],true
] call CBA_settings_fnc_init;
[
	"UAS_option_maxDistCough","SLIDER",
	["Cough - Max Hearing Distance","Sound fade-out distance. (DEFAULT: 250)"],
	["Unit Ambient SFX Options","Coughing"],
	[50,1000,250,0],true
] call CBA_settings_fnc_init;
//-----------------------------------------------------------------------------------------------//
// Sigh
//-----------------------------------------------------------------------------------------------//
[
	"UAS_option_enableSigh","CHECKBOX",
	["Sigh - Enable","Enables ambient sighs. (DEFAULT: TRUE)"],
	["Unit Ambient SFX Options","Sighs"],
	true,true,{},true
] call CBA_settings_fnc_init;
[
	"UAS_option_minIntervalSigh","SLIDER",
	["Sigh - Min Interval","Mininum random interval time in seconds. (Gaussian distribution) (DEFAULT: 60)"],
	["Unit Ambient SFX Options","Sighs"],
	[15,300,60,0],true
] call CBA_settings_fnc_init;
[
	"UAS_option_intMultiplierSigh","SLIDER",
	["Sigh - Random Multiplier","A random time is generated from the product of Min Interval times this number, then added to the minimum. (DEFAULT: 2.5)"],
	["Unit Ambient SFX Options","Sighs"],
	[0,10,2.5,2],true
] call CBA_settings_fnc_init;
[
	"UAS_option_chanceSigh","SLIDER",
	["Sigh - Chance","Chance sound will play after random interval has elapsed. (DEFAULT: 0.1)"],
	["Unit Ambient SFX Options","Sighs"],
	[0,1,0.1,2],true
] call CBA_settings_fnc_init;
[
	"UAS_option_maxDistSigh","SLIDER",
	["Sigh - Max Hearing Distance","Sound fade-out distance. (DEFAULT: 150)"],
	["Unit Ambient SFX Options","Sighs"],
	[50,1000,150,0],true
] call CBA_settings_fnc_init;
//-----------------------------------------------------------------------------------------------//
// Whistle
//-----------------------------------------------------------------------------------------------//
[
	"UAS_option_enableWhistle","CHECKBOX",
	["Whistle - Enable","Enables ambient whistling. Will not trigger if unit is in combat or damaged. (DEFAULT: TRUE)"],
	["Unit Ambient SFX Options","Whistling"],
	true,true,{},true
] call CBA_settings_fnc_init;
[
	"UAS_option_minIntervalWhistle","SLIDER",
	["Whistle - Min Interval","Mininum random interval time in seconds. (Gaussian distribution) (DEFAULT: 120)"],
	["Unit Ambient SFX Options","Whistling"],
	[15,300,120,0],true
] call CBA_settings_fnc_init;
[
	"UAS_option_intMultiplierWhistle","SLIDER",
	["Whistle - Random Multiplier","A random time is generated from the product of Min Interval times this number, then added to the minimum. (DEFAULT: 2.5)"],
	["Unit Ambient SFX Options","Whistling"],
	[0,10,2.5,2],true
] call CBA_settings_fnc_init;
[
	"UAS_option_chanceWhistle","SLIDER",
	["Whistle - Chance","Chance sound will play after random interval has elapsed. (DEFAULT: 0.03)"],
	["Unit Ambient SFX Options","Whistling"],
	[0,1,0.03,2],true
] call CBA_settings_fnc_init;
[
	"UAS_option_maxDistWhistle","SLIDER",
	["Whistle - Max Hearing Distance","Sound fade-out distance. (DEFAULT: 250)"],
	["Unit Ambient SFX Options","Whistling"],
	[50,1000,250,0],true
] call CBA_settings_fnc_init;
