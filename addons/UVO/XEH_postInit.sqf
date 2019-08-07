if (hasInterface) then {
	[
		"Unit Voice-Overs",
		"UVO_callout",
		["Say directional enemy callout","(DEFAULT: T)"],
		{[player] call UVO_fnc_calloutDir; false},
		{false},[0x14,[false,false,false]],false
	] call CBA_fnc_addKeybind;
};
