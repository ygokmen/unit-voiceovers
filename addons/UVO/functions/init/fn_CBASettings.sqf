//	[
//		"Commy_ViewDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
//		"SLIDER", // setting type
//		"View Distance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
//		"My Mission Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
//		[200, 15000, 5000, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
//		nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
//		{  
//			params ["_value"];
//			setViewDistance _value;
//		} // function that will be executed once on mission start and every time the setting is changed.
//	] call CBA_Settings_fnc_init;

UVO_option_clientEnabled = profileNamespace getVariable ["UVO_option_clientEnabled", true];
UVO_option_killConfirmsEnabled = profileNamespace getVariable ["UVO_option_killConfirmsEnabled", true];
UVO_option_soundsDiameter = profileNamespace getVariable ["UVO_option_soundsDiameter", 300];
UVO_option_soundsSamplePitch = profileNamespace getVariable ["UVO_option_soundsSamplePitch", 1];
UVO_option_deathShoutsVolume = profileNamespace getVariable ["UVO_option_deathShoutsVolume", 3];
UVO_option_deathShoutsDiameter = profileNamespace getVariable ["UVO_option_deathShoutsDiameter", 300];

[
	"gokoVO_var_enableSentences", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"CHECKBOX", // setting type
	["Arma3 robotic VOs","Arma 3 default chatter option. Disabling for better experience is recommended"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's Compatibility settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	true, // default
	true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
		params ["_boolean"];
		enableSentences _boolean;
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
	"goko_vo_BLUFORcompatibility", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"CHECKBOX", // setting type
	["SoldierWB factions are friendly between each other","Disable if you have factions inheriting from SoldierWB fighting against each other in scenario"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's Compatibility settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	true, // default
	true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
	"goko_vo_OPFORcompatibility", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"CHECKBOX", // setting type
	["SoldierEB factions are friendly between each other","Disable if you have factions inheriting from SoldierEB fighting against each other in scenario"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's Compatibility settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	true, // default
	true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
	"goko_vo_INDIcompatibility", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"CHECKBOX", // setting type
	["SoldierGB factions are friendly between each other","Disable if you have factions inheriting from SoldierGB fighting against each other in scenario"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's Compatibility settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	true, // default
	true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
	"goko_vo_client_enabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"LIST", // setting type
	["Client voice-over functions","Local setting. Decide for yourself."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's General settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[[true,false],["Enabled","Disabled"],0], // default
	false, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;	

[
	"goko_vo_konfirms", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"LIST", // setting type
	["Client vocal kill confirms","Local setting. Decide for yourself."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's General settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[[true,false],["Yeah sure.","No thanks."],0], // default
	false, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;	

[
	"goko_vo_soundsdiameter", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	["Voice travel distance (meters)","It represents a fade-out diameter with unit at centre; 300 will give you 150m max sound travel distance."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's General settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[150,420,300,0], // default
	true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;

[
	"goko_vo_deathshouts_volume", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"LIST", // setting type
	["Death scream volume","Pain shouts played upon unit death"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's General settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[[0,2,2.4,3,3.5,3.8],["Disabled","Very Low","Low","Normal","High", "Very high"],3], // default
	true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;		

[
	"goko_vo_deathshouts_diameter", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	["Death screams travel distance (meters)","It represents a fade-out diameter with unit at centre; 300 will give you 150m max sound travel distance."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's General settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[150,420,310,0], // default
	true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;		

[
	"goko_vo_soundsamplepitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
	"SLIDER", // setting type
	["Sound samples' pitch","always nice to have some goofy shit"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
	"Goko Unit VO's General settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
	[0.8,1.2,1,2], // default
	false, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
	{
	} // function that will be executed once on mission start and every time the setting is changed.
] call CBA_Settings_fnc_init;
