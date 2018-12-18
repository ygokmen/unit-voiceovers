/*--------------------------------------------------------
Authors: Sceptre
preInit function
----------------------------------------------------------*/
// ACE Medical compat
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
	UVO_ACE3Loaded = true;
} else {
	UVO_ACE3Loaded = false;
};

// Init class event handlers
["SoldierEB","init",{[(_this # 0),'EAST'] call UVO_fnc_unitInit}] call CBA_fnc_addClassEventHandler;
["SoldierGB","init",{[(_this # 0),'GUER'] call UVO_fnc_unitInit}] call CBA_fnc_addClassEventHandler;
["SoldierWB","init",{[(_this # 0),'WEST'] call UVO_fnc_unitInit}] call CBA_fnc_addClassEventHandler;

// InitPost class event handlers
["SoldierEB","initPost",{(_this # 0) call UVO_fnc_unitInitPost}] call CBA_fnc_addClassEventHandler;
["SoldierGB","initPost",{(_this # 0) call UVO_fnc_unitInitPost}] call CBA_fnc_addClassEventHandler;
["SoldierWB","initPost",{(_this # 0) call UVO_fnc_unitInitPost}] call CBA_fnc_addClassEventHandler;
