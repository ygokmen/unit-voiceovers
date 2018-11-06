if(!hasInterface) exitWith {};

[
	{
		!isNull player && !isNull (findDisplay 46);
	},
	{
		[
			"Unit Voice-Overs",
			"UVO_callout",
			["Reveal enemy direction","Gives a directional callout"],
			{
				[player] call UVO_fnc_callout;
			},
			"",
			[0x14,[false,false,false]],
			false
		] call CBA_fnc_addkeybind;

		UVO_callout_keyDown = false;
	
		UVO_callout_key = (findDisplay 46) displayAddEventHandler ["KeyDown",{
				params ["_display","_dikKey","_shift","_ctrl","_alt"];
				
				if (_dikKey in (actionkeys "RevealTarget")) then
				{
					if (UVO_callout_keyDown) exitwith {};
					
					UVO_callout_keyDown = true;
					private _calloutKeybind = (["Unit Voice-Overs", "UVO_callout"] call CBA_fnc_getKeybind) select 5;
					if ((_calloutKeybind select 0) in (actionkeys "RevealTarget")) exitwith{};
				};
			}
		];
		
		UVO_callout_keyUp = (findDisplay 46) displayAddEventHandler ["KeyUp",{
				params ["_display","_dikKey","_shift","_ctrl","_alt"];

				if (_dikKey in (actionkeys "RevealTarget")) then
				{
					UVO_callout_keyDown = false;
				};
			}
		];
	}
] call CBA_fnc_waitUntilAndExecute;