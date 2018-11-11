/*--------------------------------------------------------
Authors: Sceptre
postInit function
----------------------------------------------------------*/
if (!isServer) exitWith {};

if (UVO_option_ambientGenericEnabled) then {
	UVO_ambientGenericStateMachine = [configFile >> "UVO_ambientGenericStateMachine"] call CBA_statemachine_fnc_createFromConfig;
};

if (UVO_option_ambientRadioEnabled) then {
	UVO_ambientRadioStateMachine = [configFile >> "UVO_ambientRadioStateMachine"] call CBA_statemachine_fnc_createFromConfig;
};
