/*--------------------------------------------------------
Authors: Sceptre
Sets a given faction to a nationality.

Parameters:
0: Faction class <STRING>
1: Nationality suffix <STRING>

Return Value:
Nothing
----------------------------------------------------------*/
params [["_faction","",[""]],["_nationality","",[""]],["_definitionFile","",[""]]];

if ((_faction isEqualTo "") || (_nationality isEqualTo "")) exitWith {
	diag_log "UVO ERROR: UVO_fnc_setNationality: FACTION OR NATIONALITY SUFFIX MISSING";
};

if (isNil "UVO_customNationalities") then {
	missionNamespace setVariable ["UVO_customNationalities",[]];
};

// Define defaults in case users want to use default UVO definitions
if (isNil "UVO_customNationalitySuffixes") then {
	missionNamespace setVariable ["UVO_customNationalitySuffixes",["EAST","GUER","WEST"]];
};

if (_nationality in UVO_customNationalitySuffixes) then {
	UVO_customNationalities pushBack [_faction,_nationality];
	diag_log format["UVO INFO: UVO_fnc_createNationality: FACTION '%1' SET WITH NATIONALITY '%2'",_faction,_nationality];
} else {
	diag_log format["UVO ERROR: UVO_fnc_setNationality: NATIONALITY '%1' NOT CREATED",_nationality];
};
