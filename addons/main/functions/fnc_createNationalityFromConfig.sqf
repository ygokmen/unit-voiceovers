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

if (isNull _config || !isClass _config) exitWith {
	diag_log "UVO ERROR: UVO_fnc_createNationalityFromConfig: CONFIG DOES NOT EXIST";
};

// Get nationality name/suffix
private _nationality = getText (_config >> "nationality");

// Get factions list
private _factions = getArray (_config >> "factions");

// Get definitions
private _defConfig = (_config >> "definitions");
private _definitions = [
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
];

[_nationality,_factions,_definitions] call FUNC(createNationality);
