/*--------------------------------------------------------
Authors: Sceptre
Sets given factions to an already created nationality.
Use for compatibility of factions with bad class inheritance.

Parameters:
0: Nationality name (Available Default Options: "EAST","GUER","WEST") <STRING>
1: Array of faction class strings <ARRAY>

Return Value:
Nothing

Example:
['WEST',['BLU_F','IND_F']] call UVO_fnc_setNationality;
----------------------------------------------------------*/
params [["_nationality","",[""]],["_factions",[],[[]]]];

if (_nationality isEqualTo "" || _factions isEqualTo []) exitWith {
	diag_log "UVO ERROR: UVO_fnc_setNationality: NATIONALITY OR FACTIONS ARE MISSING";
};

if (isNil "UVO_customNationalities") then {
	missionNamespace setVariable ["UVO_customNationalities",[]];
};

{
	_faction = _x;
	if (_nationality in ["EAST","GUER","WEST"]) then {
		UVO_customNationalities pushBack [_faction,_nationality];
		diag_log format["UVO INFO: UVO_fnc_setNationality: FACTION '%1' SET WITH NATIONALITY '%2'",_faction,_nationality];
	} else {
		if !((UVO_customNationalities select {(_x # 1) == _nationality}) isEqualTo []) then {
			UVO_customNationalities pushBack [_faction,_nationality];
			diag_log format["UVO INFO: UVO_fnc_setNationality: FACTION '%1' SET WITH NATIONALITY '%2'",_faction,_nationality];
		} else {
			diag_log format["UVO ERROR: UVO_fnc_setNationality: NATIONALITY '%1' DOES NOT EXIST",_nationality];
		};
	};
	false
} count _factions;
