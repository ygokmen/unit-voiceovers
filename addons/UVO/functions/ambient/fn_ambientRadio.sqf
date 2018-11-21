/*--------------------------------------------------------
Authors: Sceptre
Makes group play an ambient radio sound, should be called via remoteExec

Parameters:
0: Group

Return Value:
Nothing
----------------------------------------------------------*/
params ["_group"];

// Chance to do anything
if (random 1 > UVO_option_ambientRadioChance) exitWith {};

// 0 : All AI + Players
// 1 : Only AI
// 2 : Only group leaders
// 3 : Only AI group leaders
switch (UVO_option_ambientRadioSetting) do {
	case 0 : {
		private _units = units _group;

		// If players aren't supposed to use UVO then removed them from selection
		if (!UVO_option_clientEnabled && {(_units findIf {isPlayer _x}) != -1}) then {
			_units = _units - (_units select {isPlayer _x});
		};

		if (_units isEqualTo []) exitWith {};

		// Select unit that can say shit
		private _radioOperator = selectRandom (_units select {alive _x && !isNil {_x getVariable "UVO_unitNationality"}});
		if (isNil "_radioOperator") exitWith {};
		if (behaviour _radioOperator == "STEALTH") exitWith {};

		[_radioOperator,[selectRandom (missionNamespace getVariable "UVO_ambientRadio"),UVO_option_soundsDiameter,UVO_option_soundsSamplePitch]] remoteExec ["say3D",0];
	};
	case 1 : {
		private _units = units _group;

		// Select unit that can say shit and exclude players
		private _radioOperator = selectRandom (_units select {alive _x && !isPlayer _x && !isNil {_x getVariable "UVO_unitNationality"}});
		if (isNil "_radioOperator") exitWith {};
		if (behaviour _radioOperator == "STEALTH") exitWith {};

		[_radioOperator,[selectRandom (missionNamespace getVariable "UVO_ambientRadio"),UVO_option_soundsDiameter,UVO_option_soundsSamplePitch]] remoteExec ["say3D",0];
	};
	case 2 : {
		private _leader = leader _group;

		// Players allowed, just check if UVO is disabled on players
		if (isPlayer _leader && !UVO_option_clientEnabled) exitWith {};

		// Stop if unit isn't usable
		if (!alive _leader || isNil {_leader getVariable "UVO_unitNationality"}) exitWith {};
		if (behaviour _leader == "STEALTH") exitWith {};

		[_leader,[selectRandom (missionNamespace getVariable "UVO_ambientRadio"),UVO_option_soundsDiameter,UVO_option_soundsSamplePitch]] remoteExec ["say3D",0];
	};
	case 3 : {
		private _leader = leader _group;

		// Players not allowed
		if (isPlayer _leader) exitWith {};

		// Stop if unit isn't usable
		if (!alive _leader || isNil {_leader getVariable "UVO_unitNationality"}) exitWith {};
		if (behaviour _leader == "STEALTH") exitWith {};

		[_leader,[selectRandom (missionNamespace getVariable "UVO_ambientRadio"),UVO_option_soundsDiameter,UVO_option_soundsSamplePitch]] remoteExec ["say3D",0];
	};
	default {};
};
