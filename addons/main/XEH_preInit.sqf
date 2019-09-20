#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

// CBA Settings
#include "initSettings.sqf"
if (is3DEN) exitWith {};

// Declare default nationalities and other definitions
call FUNC(defaultNationalities);
call FUNC(defaultDefinitions);

// ACE Medical Compatibility
UVO_ACEMedicalLoaded = isClass (configFile >> "CfgPatches" >> "ace_medical");

// Soldier init event handlers
["SoldierEB","init",{[_this # 0,"EAST"] call FUNC(init);}] call CBA_fnc_addClassEventHandler;
["SoldierGB","init",{[_this # 0,"GUER"] call FUNC(init);}] call CBA_fnc_addClassEventHandler;
["SoldierWB","init",{[_this # 0,"WEST"] call FUNC(init);}] call CBA_fnc_addClassEventHandler;

// Soldier initPost event handlers for enableSentences
["SoldierEB","init",{(_this # 0) call FUNC(initPost);}] call CBA_fnc_addClassEventHandler;
["SoldierGB","init",{(_this # 0) call FUNC(initPost);}] call CBA_fnc_addClassEventHandler;
["SoldierWB","init",{(_this # 0) call FUNC(initPost);}] call CBA_fnc_addClassEventHandler;
