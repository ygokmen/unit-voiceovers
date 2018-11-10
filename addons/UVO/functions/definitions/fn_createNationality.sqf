/*--------------------------------------------------------
Authors: Sceptre
Used to define a new nationality used by the UVO framework.

Parameters:
0: Nationality suffix name <STRING>
1: Path to sound set definition file <STRING>

Return Value:
Nothing
----------------------------------------------------------*/
params [["_nationality","",[""]],["_definitionFile","",[""]]];

if ((_nationality isEqualTo "") || _definitionFile isEqualTo "") exitWith {
	diag_log "UVO ERROR: UVO_fnc_createNationality: NATIONALITY SUFFIX OR DEFINITION FILE MISSING";
};

// Define sound sets
call compile preprocessFileLineNumbers _definitionFile;

// Check for undefined sound sets
private _missingDefinitions = switch (true) do {
	case (isNil format["UVO_callouts_%1",_nationality]) : {true};
	case (isNil format["UVO_explosive_%1",_nationality]) : {true};
	case (isNil format["UVO_flash_%1",_nationality]) : {true};
	case (isNil format["UVO_frag_%1",_nationality]) : {true};
	case (isNil format["UVO_incendiary_%1",_nationality]) : {true};
	case (isNil format["UVO_smoke_%1",_nationality]) : {true};
	case (isNil format["UVO_spotNade_%1",_nationality]) : {true};
	case (isNil format["UVO_friendlyFire_%1",_nationality]) : {true};
	case (isNil format["UVO_wounded_%1",_nationality]) : {true};
	case (isNil format["UVO_allyDown_%1",_nationality]) : {true};
	case (isNil format["UVO_targDownHi_%1",_nationality]) : {true};
	case (isNil format["UVO_targDownLo_%1",_nationality]) : {true};
	case (isNil format["UVO_cover_%1",_nationality]) : {true};
	case (isNil format["UVO_ammoLow_%1",_nationality]) : {true};
	case (isNil format["UVO_reloading_%1",_nationality]) : {true};
	default {false};
};

// Cancel if missing required definitions
if (_missingDefinitions) exitWith {
	diag_log format["UVO ERROR: UVO_fnc_createNationality: NATIONALITY '%1' MISSING DEFINITIONS",_nationality]
};

if (isNil "UVO_customNationalities") then {
	missionNamespace setVariable ["UVO_customNationalities",[]];
	missionNamespace setVariable ["UVO_customNationalitySuffixes",[]];
	diag_log "UVO INFO: UVO_fnc_createNationality: CUSTOM NATIONALITIES INITIALIZED";
};

UVO_customNationalitySuffixes pushBack _nationality;
diag_log format["UVO INFO: UVO_fnc_createNationality: NATIONALITY '%1' CREATED",_nationality];
diag_log format["UVO INFO: Available custom nationality suffixes: %1",UVO_customNationalitySuffixes];
