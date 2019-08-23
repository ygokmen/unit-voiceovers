// CBA Settings
call compile preprocessFileLineNumbers "UVO\CBA_Settings.sqf";
if (is3DEN) exitWith {};

// Declare default nationalities and other definitions
call UVO_fnc_defaultNationalities;
call UVO_fnc_defaultDefinitions;

// ACE Medical Compatibility
UVO_ACEMedicalLoaded = isClass (configFile >> "CfgPatches" >> "ace_medical");

// Soldier init event handlers
["SoldierEB","init",{[_this # 0,"EAST"] call UVO_fnc_init;}] call CBA_fnc_addClassEventHandler;
["SoldierGB","init",{[_this # 0,"GUER"] call UVO_fnc_init;}] call CBA_fnc_addClassEventHandler;
["SoldierWB","init",{[_this # 0,"WEST"] call UVO_fnc_init;}] call CBA_fnc_addClassEventHandler;

// Soldier initPost event handlers for enableSentences
["SoldierEB","init",{(_this # 0) call UVO_fnc_initPost;}] call CBA_fnc_addClassEventHandler;
["SoldierGB","init",{(_this # 0) call UVO_fnc_initPost;}] call CBA_fnc_addClassEventHandler;
["SoldierWB","init",{(_this # 0) call UVO_fnc_initPost;}] call CBA_fnc_addClassEventHandler;
