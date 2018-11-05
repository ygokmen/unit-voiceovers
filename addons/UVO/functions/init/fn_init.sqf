if (isServer) then {
	if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
		missionNamespace setVariable ["UVO_ACE3Loaded",true,true];
	};
};

enableSentences false;
UVO_option_clientEnabled = true;
UVO_option_killConfirmEnabled = true;
UVO_option_killConfirmChance = 0.5;
UVO_option_soundsDiameter = 300;
UVO_option_soundsSamplePitch = 1;
UVO_option_deathShoutsVolume = 3;
UVO_option_deathShoutsDiameter = 300;