/*--------------------------------------------------------
Authors: Sceptre
Generic preInit function
----------------------------------------------------------*/
if (is3DEN) exitWith {};

// ACE Medical compat
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	UVO_ACE3Loaded = true;
} else {
	UVO_ACE3Loaded = false;
};

// Add soldier class event handlers
["SoldierEB","init",{[(_this select 0),'EAST'] call UVO_fnc_classInit}] call CBA_fnc_addClassEventHandler;
["SoldierGB","init",{[(_this select 0),'GUER'] call UVO_fnc_classInit}] call CBA_fnc_addClassEventHandler;
["SoldierWB","init",{[(_this select 0),'WEST'] call UVO_fnc_classInit}] call CBA_fnc_addClassEventHandler;
