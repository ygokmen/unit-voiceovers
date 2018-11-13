/*--------------------------------------------------------
Authors: Sceptre
postInit function
----------------------------------------------------------*/
// Server only
if (isServer) then {
	if (UVO_option_ambientGenericEnabled) then {
		UVO_ambientGenericStateMachine = [configFile >> "UVO_ambientGenericStateMachine"] call CBA_statemachine_fnc_createFromConfig;
	};

	if (UVO_option_ambientRadioEnabled) then {
		UVO_ambientRadioStateMachine = [configFile >> "UVO_ambientRadioStateMachine"] call CBA_statemachine_fnc_createFromConfig;
	};
};

// Player only
if (hasInterface) then {
	[
		"Unit Voice-Overs",
		"UVO_callout",
		["Say directional enemy callout","(DEFAULT: T)"],
		{
			[player] call UVO_fnc_calloutDir
		},
		{false},
		[0x14,[false,false,false]],
		false
	] call CBA_fnc_addKeybind;	
};
