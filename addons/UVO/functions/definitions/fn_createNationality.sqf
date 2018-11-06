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
    class UVO_OPF_F {
        init = "['OPF_F','ARAB','nationality_ARAB.sqf'] call UVO_fnc_createNationality;";
    };
};
----------------------------------------------------------*/
params [["_faction",""],["_nationality",""],["_definitionFile",""]];

if (isNil "UVO_customNationalities") then {
	missionNamespace setVariable ["UVO_customNationalities",[]];
};

UVO_customNationalities pushBack [_faction,_nationality];

call compile preprocessFileLineNumbers _definitionFile;
