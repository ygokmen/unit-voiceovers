#define VERSION "0.1"
#define REQUIRED_VERSION 1.88

class CfgPatches {
	class UAS {
		name = "Unit Ambient SFX";
		version = VERSION;
		author = "UAS Team";
		authors[] = {"Sceptre","Gokmen"};
		url = "";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"cba_common",
			"cba_events",
			"cba_settings",
			"cba_statemachine",
			"cba_xeh"
		};
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
