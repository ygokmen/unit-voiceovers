if(!hasInterface) exitWith {};

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[
	"Unit Voice-Overs",
	"UVO_calloutDir",
	"Say directional callout",
	{
		player call UVO_fnc_calloutDir;
	},
	"",
	[DIK_T, [false, false, false]],
	false
] call CBA_fnc_addKeybind;