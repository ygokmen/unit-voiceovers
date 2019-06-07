/*-----------------------------------------------------------------------------------------------//
Authors: Sceptre
Makes group play an ambient sound

Parameters:
0: Group <GROUP>

Return Value:
Nothing
//-----------------------------------------------------------------------------------------------*/
params ["_group"];

switch (_group getVariable "UAS_manifest") do {
	// Radio
	case 0 : {
		_group setVariable ["UAS_intervalRadio",CBA_missionTime + UAS_option_minIntervalRadio + random (UAS_option_minIntervalRadio * UAS_option_intMultiplierRadio)];
		
		if (random 1 < UAS_option_chanceRadio) then {
			_group call UAS_fnc_ambientRadio;
		};
	};
};
