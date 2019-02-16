#define VERSION "1.5"
#define REQUIRED_VERSION 1.88

class CfgPatches {
	class UVO {
		name = "Unit Voice-overs";
		version = VERSION;
		author = "UVO Team";
		authors[] = {"Gokmen","Sceptre"};
		url = "https://github.com/the0utsider/unit-voiceovers";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"cba_common",
			"cba_events",
			"cba_keybinding",
			"cba_settings",
			"cba_statemachine",
			"cba_xeh"
		};
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
