// optional cba settings to provide freedom and customization. going to add more options, not finished.
// example from cba wiki:
//		[
//			"Commy_ViewDistance", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
//			"SLIDER", // setting type
//			"View Distance", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
//			"My Mission Settings", // Pretty name of the category where the setting can be found. Can be stringtable entry.
//			[200, 15000, 5000, 0], // data for this setting: [min, max, default, number of shown trailing decimals]
//			nil, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
//			{  
//				params ["_value"];
//				setViewDistance _value;
//			} // function that will be executed once on mission start and every time the setting is changed.
//		] call CBA_Settings_fnc_init;

goko_vo_soundsdiameter = profileNamespace getVariable ["goko_vo_soundsdiameter",300];
goko_vo_playeronoffswitch = profileNamespace getVariable ["goko_vo_playeronoffswitch",true];
goko_vo_soundsamplepitch = profileNamespace getVariable ["goko_vo_soundsamplepitch",1];
goko_vo_deathshouts_volume = profileNamespace getVariable ["goko_vo_deathshouts_volume", 3.4];
goko_vo_killconfirmratio = profileNamespace getVariable ["goko_vo_killconfirmratio", 50];



if(isClass(configFile >> "CfgPatches" >> "cba_settings")) then 
{
	[] spawn 
	{
		
		[
			"goko_vo_playeronoffswitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"CHECKBOX", // setting type
			["Enable voice-overs for player unit","Uncheck to disable VO for player"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Unit VO's", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			true, // default
			true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
  
		[
			"goko_vo_soundsamplepitch", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			["Sound samples' pitch","always nice to have some goofy shit"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Unit VO's", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[0.9,1.2,1,2], // default
			true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;

		[
			"goko_vo_soundsdiameter", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"SLIDER", // setting type
			["Sounds' travel distance (meters)","It represents a diameter with unit at centre; 150 will give you 75 meters sound travel distance."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Unit VO's", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[150,420,300,0], // default
			true, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;
		
		[
			"goko_vo_deathshouts_volume", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"LIST", // setting type
			["Shout volume","Pain shouts played upon unit death"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Unit VO's", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[[0,1.4,2.4,3.4,4.4,5],["Disabled","Very Low","Low","Normal","High", "Very high"],3], // default
			false, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;			
		
		[
			"goko_vo_killconfirmratio", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
			"LIST", // setting type
			["Kill confirm ratio","Say something whenever you get a kill"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
			"Goko Unit VO's", // Pretty name of the category where the setting can be found. Can be stringtable entry.
			[[0,50,75,100],["Never","Sometimes","Often","Always"],1], // default
			false, // "global" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
			{
			} // function that will be executed once on mission start and every time the setting is changed.
		] call CBA_Settings_fnc_init;	
	};	
};
