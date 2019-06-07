/*-----------------------------------------------------------------------------------------------//
Authors: Sceptre
Makes unit play an ambient sound

Parameters:
0: Unit <OBJECT>

Return Value:
Nothing
//-----------------------------------------------------------------------------------------------*/
params ["_unit"];

private _exitCondition = (isPlayer _unit && UAS_option_disableOnPlayers) || behaviour _unit == "STEALTH" || !(_unit in _unit);

switch (_unit getVariable "UAS_manifest") do {
	// Cough
	case 0 : {
		_unit setVariable ["UAS_intervalCough",CBA_missionTime + UAS_option_minIntervalCough + random (UAS_option_minIntervalCough * UAS_option_intMultiplierCough)];
		if (_exitCondition) exitWith {};

		private _chanceModifier = damage _unit + 0.8;
		if (random 1 < UAS_option_chanceCough * _chanceModifier) then {
			[_unit,[selectRandom UAS_coughs,UAS_option_maxDistCough]] remoteExec ["say3D",0];
		};
	};
	// Sigh
	case 1 : {
		_unit setVariable ["UAS_intervalSigh",CBA_missionTime + UAS_option_minIntervalSigh + random (UAS_option_minIntervalSigh * UAS_option_intMultiplierSigh)];
		if (_exitCondition) exitWith {};

		if (random 1 < UAS_option_chanceSigh) then {
			[_unit,[selectRandom UAS_sighs,UAS_option_maxDistSigh]] remoteExec ["say3D",0];
		};
	};
	// Whistle
	case 2 : {
		_unit setVariable ["UAS_intervalWhistle",CBA_missionTime + UAS_option_minIntervalWhistle + random (UAS_option_minIntervalWhistle * UAS_option_intMultiplierWhistle)];
		if (_exitCondition) exitWith {};
		if (behaviour _unit == "COMBAT" || damage _unit > 0.1) exitWith {};
		
		if (random 1 < UAS_option_chanceWhistle) then {
			[_unit,[selectRandom UAS_whistles,UAS_option_maxDistWhistle]] remoteExec ["say3D",0];
		};
	};
};
