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
private _calloutsN = getArray (_defConfig >> "calloutsN");
private _calloutsNE = getArray (_defConfig >> "calloutsNE");
private _calloutsE = getArray (_defConfig >> "calloutsE");
private _calloutsSE = getArray (_defConfig >> "calloutsSE");
private _calloutsS = getArray (_defConfig >> "calloutsS");
private _calloutsSW = getArray (_defConfig >> "calloutsSW");
private _calloutsW = getArray (_defConfig >> "calloutsW");
private _calloutsNW = getArray (_defConfig >> "calloutsNW");
private _explosive = getArray (_defConfig >> "explosive");
private _flash = getArray (_defConfig >> "flash");
private _frag = getArray (_defConfig >> "frag");
private _incendiary = getArray (_defConfig >> "incendiary");
private _smoke = getArray (_defConfig >> "smoke");
private _spotNade = getArray (_defConfig >> "spotNade");
private _friendlyFire = getArray (_defConfig >> "friendlyFire");
private _wounded = getArray (_defConfig >> "wounded");
private _allyDown = getArray (_defConfig >> "allyDown");
private _targDownHi = getArray (_defConfig >> "targDownHi");
private _targDownLo = getArray (_defConfig >> "targDownLo");
private _cover = getArray (_defConfig >> "cover");
private _ammoLow = getArray (_defConfig >> "ammoLow");
private _reloading = getArray (_defConfig >> "reloading");

missionNamespace setVariable [format["UVO_callouts_%1",_nationality],
    [
        _calloutsN,
        _calloutsNE,
        _calloutsE,
        _calloutsSE,
        _calloutsS,
        _calloutsSW,
        _calloutsW,
        _calloutsNW
    ]
];
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

diag_log format["UVO INFO: NATIONALITY %1 CREATED",_nationality];

if (isNil "UVO_customNationalities") then {
	missionNamespace setVariable ["UVO_customNationalities",[]];
};

{
	UVO_customNationalities pushBack [_x,_nationality];
	diag_log format["UVO INFO: FACTION %1 SET WITH NATIONALITY %2",_x,_nationality];
} forEach _factions;
