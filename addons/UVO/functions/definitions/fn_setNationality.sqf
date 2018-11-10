/*--------------------------------------------------------
Authors: Sceptre
Sets a given faction to a user-created nationality.

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

if (_nationality in UVO_customNationalitySuffixes) then {
	UVO_customNationalities pushBack [_faction,_nationality];
	diag_log format["UVO INFO: UVO_fnc_createNationality: FACTION '%1' SET WITH NATIONALITY '%2'",_faction,_nationality];
} else {
	diag_log format["UVO ERROR: UVO_fnc_setNationality: NATIONALITY '%1' NOT CREATED",_nationality];
};
