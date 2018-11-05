/*
	Example (in description.ext):

	class Extended_PreInit_EventHandlers {
	    class UVO_BLU_F {	// UVO_faction_name
	        init = "['BLU_F','ARAB','nationality_ARAB.sqf'] call UVO_fnc_createNationality;"; // 'faction_name,'nationalitySuffix','pathToDefinitionFile'
	    };
	    class UVO_OPF_F {
	        init = "['OPF_F','ARAB','nationality_ARAB.sqf'] call UVO_fnc_createNationality;";
	    };
	};
*/
params [["_faction","",[""]],["_nationality","",[""]],["_definitionFile","",[""]]];

// make it so there can be as many nationalities... use pushBack or append
if (isNil "UVO_customNationalities") then {
	missionNamespace setVariable ["UVO_customNationalities",[]];
};

UVO_customNationalities pushBack [_faction,_nationality];

call compile preprocessFileLineNumbers _definitionFile;
