#include "script_component.hpp"

class CfgPatches {
	class UVO {
		name = "Unit Voice-overs";
		author = "UVO Team";
		authors[] = {"Gokmen","Sceptre"};
		url = "https://github.com/the0utsider/unit-voiceovers";
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"cba_main",
			"cba_common",
			"cba_events",
			"cba_keybinding",
			"cba_settings",
			"cba_statemachine",
			"cba_xeh"
		};
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgSounds.hpp"
