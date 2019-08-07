/*--------------------------------------------------------
UVO_fnc_createNationalityFromConfig
Authors: Sceptre

Creates a custom nationality via config file and sets assigned factions to the nationality

Parameters:
0: Nationality config <CONFIG>

Public:
Yes

Return Value:
Nothing

Example:
[configFile >> "UVO_myCustomNationalityConfig"] call UVO_fnc_createNationalityFromConfig
----------------------------------------------------------*/
params [["_config",configNull,[configNull]]];

if (isNull _config) exitWith {
	diag_log "UVO ERROR: UVO_fnc_createNationalityFromConfig: CONFIG DOES NOT EXIST";
};

// Get nationality name/suffix
private _nationality = getText (_config >> "nationality");

// Get factions list
private _factions =  getArray (_config >> "factions");

// Get definitions
private _defConfig = (_config >> "definitions");
[
	getArray (_defConfig >> "calloutsN"),
	getArray (_defConfig >> "calloutsNE"),
	getArray (_defConfig >> "calloutsE"),
	getArray (_defConfig >> "calloutsSE"),
	getArray (_defConfig >> "calloutsS"),
	getArray (_defConfig >> "calloutsSW"),
	getArray (_defConfig >> "calloutsW"),
	getArray (_defConfig >> "calloutsNW"),
	getArray (_defConfig >> "explosive"),
	getArray (_defConfig >> "flash"),
	getArray (_defConfig >> "frag"),
	getArray (_defConfig >> "incendiary"),
	getArray (_defConfig >> "smoke"),
	getArray (_defConfig >> "spotNade"),
	getArray (_defConfig >> "friendlyFire"),
	getArray (_defConfig >> "wounded"),
	getArray (_defConfig >> "allyDown"),
	getArray (_defConfig >> "targDownHi"),
	getArray (_defConfig >> "targDownLo"),
	getArray (_defConfig >> "cover"),
	getArray (_defConfig >> "ammoLow"),
	getArray (_defConfig >> "reloading"),
	getArray (_defConfig >> "rocketSuppression"),
	getArray (_defConfig >> "bulletSuppression")
] params [
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
