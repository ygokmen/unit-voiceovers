/*--------------------------------------------------------
Authors: Sceptre
PreInit function
----------------------------------------------------------*/
// CBA Settings
call UVO_fnc_CBASettings;
if (is3DEN) exitWith {};

// Declare default nationalities and other definitions
call UVO_fnc_defaultNationalities;
call UVO_fnc_defaultDefinitions;

// ACE Medical Compatibility
UVO_ACEMedicalLoaded = [false,true] select (isClass (configFile >> "CfgPatches" >> "ace_medical"));

// Lazy suppression Compatibility
UVO_GLSLoaded = [false,true] select (isClass (configFile >> "CfgPatches" >> "gls_visuals"));

// Soldier init event handlers
["SoldierEB","init",{[_this # 0,"EAST"] call UVO_fnc_addUVO;}] call CBA_fnc_addClassEventHandler;
["SoldierGB","init",{[_this # 0,"GUER"] call UVO_fnc_addUVO;}] call CBA_fnc_addClassEventHandler;
["SoldierWB","init",{[_this # 0,"WEST"] call UVO_fnc_addUVO;}] call CBA_fnc_addClassEventHandler;

// Soldier initPost event handlers for enableSentences
["SoldierEB","init",{(_this # 0) call UVO_fnc_unitInitPost;}] call CBA_fnc_addClassEventHandler;
["SoldierGB","init",{(_this # 0) call UVO_fnc_unitInitPost;}] call CBA_fnc_addClassEventHandler;
["SoldierWB","init",{(_this # 0) call UVO_fnc_unitInitPost;}] call CBA_fnc_addClassEventHandler;
