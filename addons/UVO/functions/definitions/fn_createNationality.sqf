/*--------------------------------------------------------
Authors: Sceptre
Defines a new user-created nationality that can be used by the UVO framework.

Parameters:
0: Nationality suffix name <STRING>
1: Path to sound set definition file <STRING>

Return Value:
Nothing

Example:
['CUSTOM','nationality_CUSTOM.sqf'] call UVO_fnc_createNationality;
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

// Define defaults in case users want to use default UVO definitions
if (isNil "UVO_customNationalitySuffixes") then {
	missionNamespace setVariable ["UVO_customNationalitySuffixes",["EAST","GUER","WEST"]];
};

UVO_customNationalitySuffixes pushBack _nationality;
diag_log format["UVO INFO: UVO_fnc_createNationality: NATIONALITY '%1' CREATED",_nationality];
diag_log format["UVO INFO: Available custom nationality suffixes: %1",(str UVO_customNationalitySuffixes)];
