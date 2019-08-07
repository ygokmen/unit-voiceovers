/*--------------------------------------------------------
UVO_fnc_createNationality
Authors: Sceptre

Creates a custom nationality via script and sets assigned factions to the nationality
Should be used during preInit

Parameters:
0: Nationality name/suffix <STRING>
1: Array of faction class strings <ARRAY>
2: Definitions array <ARRAY>

Public:
Yes

Return Value:
Nothing

Example:
See Template
----------------------------------------------------------*/
params [["_nationality","",[""]],["_factions",[],[[]]],["_definitions",[],[[]]]];

if (_nationality isEqualTo "" || _factions isEqualTo [] || _definitionFile isEqualTo []) exitWith {
	diag_log "UVO ERROR: UVO_fnc_createNationality: MISSING PARAMETERS";
};

_definitions params [
	["_calloutsN",[],[[]]],
	["_calloutsNE",[],[[]]],
	["_calloutsE",[],[[]]],
	["_calloutsSE",[],[[]]],
	["_calloutsS",[],[[]]],
	["_calloutsSW",[],[[]]],
	["_calloutsW",[],[[]]],
	["_calloutsNW",[],[[]]],
	["_explosive",[],[[]]],
	["_flash",[],[[]]],
	["_frag",[],[[]]],
	["_incendiary",[],[[]]],
	["_smoke",[],[[]]],
	["_spotNade",[],[[]]],
	["_friendlyFire",[],[[]]],
	["_wounded",[],[[]]],
	["_allyDown",[],[[]]],
	["_targDownHi",[],[[]]],
	["_targDownLo",[],[[]]],
	["_cover",[],[[]]],
	["_ammoLow",[],[[]]],
	["_reloading",[],[[]]],
	["_rocketSuppression",[],[[]]],
	["_bulletSuppression",[],[[]]]
];

missionNamespace setVariable [format["UVO_callouts_%1",_nationality],[
	_calloutsN,_calloutsNE,_calloutsE,_calloutsSE,_calloutsS,_calloutsSW,_calloutsW,_calloutsNW
]];
missionNamespace setVariable [format["UVO_explosive_%1",_nationality],_explosive];
missionNamespace setVariable [format["UVO_flash_%1",_nationality],_flash];
missionNamespace setVariable [format["UVO_frag_%1",_nationality],_frag];
missionNamespace setVariable [format["UVO_incendiary_%1",_nationality],_incendiary];
missionNamespace setVariable [format["UVO_smoke_%1",_nationality],_smoke];
missionNamespace setVariable [format["UVO_spotNade_%1",_nationality],_spotNade];
missionNamespace setVariable [format["UVO_friendlyFire_%1",_nationality],_friendlyFire];
missionNamespace setVariable [format["UVO_wounded_%1",_nationality],_wounded];
missionNamespace setVariable [format["UVO_allyDown_%1",_nationality],_allyDown];
missionNamespace setVariable [format["UVO_targDownHi_%1",_nationality],_targDownHi];
missionNamespace setVariable [format["UVO_targDownLo_%1",_nationality],_targDownLo];
missionNamespace setVariable [format["UVO_cover_%1",_nationality],_cover];
missionNamespace setVariable [format["UVO_ammoLow_%1",_nationality],_ammoLow];
missionNamespace setVariable [format["UVO_reloading_%1",_nationality],_reloading];
missionNamespace setVariable [format["UVO_rocketSuppression_%1",_nationality],_rocketSuppression];
missionNamespace setVariable [format["UVO_bulletSuppression_%1",_nationality],_bulletSuppression];

diag_log format["UVO INFO: NATIONALITY %1 CREATED",_nationality];

if (isNil "UVO_customNationalities") then {
	missionNamespace setVariable ["UVO_customNationalities",[]];
};

{
	UVO_customNationalities pushBack [_x,_nationality];
	diag_log format["UVO INFO: FACTION %1 SET WITH NATIONALITY %2",_x,_nationality];
} forEach _factions;

[
	format ["UVO_option_enableSentencesCustom_%1",_nationality],"CHECKBOX",
	[format ["%1 - Default chatter/voices",toUpper _nationality],"Allows default Arma voices for specified (custom) nationality. (Default: TRUE)"],
	["Unit Voice-Over Options","Nationality Init Settings"],
	true,true,{},true
] call CBA_Settings_fnc_init;
[
	format ["UVO_option_enableUVOCustom_%1",_nationality],"CHECKBOX",
	[format ["%1 - Enable UVO init",toUpper _nationality],"Enables initializing unit voice-overs for specified (custom) nationality. (Default: TRUE)"],
	["Unit Voice-Over Options","Nationality Init Settings"],
	true,true,{},true
] call CBA_Settings_fnc_init;
