/*--------------------------------------------------------
Authors: Sceptre
Used to define a new nationality used by the UVO framework. See example below.

Parameters:
0: Faction class <STRING>
1: Nationality suffix name <STRING>
2: Path to nationality sound definition file <STRING>

Return Value:
Nothing

Example (added via Extended_PreInit_EventHandlers in description.ext):

class Extended_PreInit_EventHandlers {
    class UVO_customCSAT {
        init = "['OPF_F','ARAB','nationality_ARAB.sqf'] call UVO_fnc_createNationality;";
    };
    class UVO_customNATO {
        init = "['BLU_F','ARAB'] call UVO_fnc_createNationality;";
    };
};
----------------------------------------------------------*/
params [["_faction","",[""]],["_nationality","",[""]],["_definitionFile","",[""]]];

if ((_faction isEqualTo "") || (_nationality isEqualTo "")) exitWith {
	diag_log "UVO ERROR: UVO_fnc_createNationality: FACTION OR NATIONALITY SUFFIX NOT DEFINED";
};

private _missingDef = false;

if !(_definitionFile isEqualTo "") then {
	call compile preprocessFileLineNumbers _definitionFile;
} else {
	if (isNil format["UVO_reloading_%1",_nationality]) then {
		_missingDef = true;
	};
};

if (_missingDef) exitWith {
	diag_log format["UVO ERROR: UVO_fnc_createNationality: NATIONALITY '%1' MISSING DEFINITIONS",_nationality];
};

if (isNil "UVO_customNationalities") then {
	missionNamespace setVariable ["UVO_customNationalities",[]];
	diag_log "UVO INFO: UVO_fnc_createNationality: CUSTOM NATIONALITIES INITIALIZED";
};

UVO_customNationalities pushBack [_faction,_nationality];
diag_log format["UVO INFO: UVO_fnc_createNationality: FACTION '%1' SET WITH NATIONALITY '%2'",_faction,_nationality];
