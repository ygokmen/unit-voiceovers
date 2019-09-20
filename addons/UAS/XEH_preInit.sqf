#include "script_component.hpp"
ADDON = false;
#include "XEH_PREP.hpp"
ADDON = true;

// CBA Settings
#include "initSettings.sqf"

if (is3DEN || !isServer) exitWith {};

// Primary class event handler
["CAManBase","init",{
	params ["_unit"];
	if (local _unit) then {
		_unit setVariable ["UAS_active",true,true];
		_unit setVariable ["UAS_intervalCough",CBA_missionTime + UAS_option_minIntervalCough + random (UAS_option_minIntervalCough * UAS_option_intMultiplierCough)];
		_unit setVariable ["UAS_intervalSigh",CBA_missionTime + UAS_option_minIntervalSigh + random (UAS_option_minIntervalSigh * UAS_option_intMultiplierSigh)];
		_unit setVariable ["UAS_intervalWhistle",CBA_missionTime + UAS_option_minIntervalWhistle + random (UAS_option_minIntervalWhistle * UAS_option_intMultiplierWhistle)];
		private _group = group _unit;
		if (isNil {_group getVariable "UAS_active"}) then {
			_group setVariable ["UAS_active",true,true];
			_group setVariable ["UAS_intervalRadio",CBA_missionTime + random (UAS_option_minIntervalRadio * UAS_option_intMultiplierRadio)];
		};
	};
}] call CBA_fnc_addClassEventHandler;

// Sound definition arrays
UAS_coughs = [
	"UAS_cough01","UAS_cough02",
	"UAS_cough03","UAS_cough04",
	"UAS_cough05","UAS_cough06",
	"UAS_cough07","UAS_cough08",
	"UAS_cough09","UAS_cough10",
	"UAS_cough11"
];

UAS_sighs = [
	"UAS_sigh01","UAS_sigh02"
];

UAS_whistles = [
	"UAS_whistle01","UAS_whistle02",
	"UAS_whistle03"
];

UAS_radioSounds = [
	"UAS_radio01","UAS_radio02",
	"UAS_radio03","UAS_radio04",
	"UAS_radio05","UAS_radio06",
	"UAS_radio07","UAS_radio08",
	"UAS_radio09","UAS_radio10",
	"UAS_radio11","UAS_radio12",
	"UAS_radio13","UAS_radio14",
	"UAS_radio15","UAS_radio16",
	"UAS_radio17","UAS_radio18",
	"UAS_radio19","UAS_radio20",
	"UAS_radio21","UAS_radio22",
	"UAS_radio23","UAS_radio24",
	"UAS_radio25","UAS_radio26",
	"UAS_radio27","UAS_radio28",
	"UAS_radio29","UAS_radio30",
	"UAS_radio31","UAS_radio32",
	"UAS_radio33","UAS_radio34",
	"UAS_radio35","UAS_radio36",
	"UAS_radio37","UAS_radio38",
	"UAS_radio39","UAS_radio40",
	"UAS_radio41","UAS_radio42",
	"UAS_radio43","UAS_radio44",
	"UAS_radio45","UAS_radio46",
	"UAS_radio47","UAS_radio48",
	"UAS_radio49","UAS_radio50",
	"UAS_radio51","UAS_radio52",
	"UAS_radio53","UAS_radio54",
	"UAS_radio55","UAS_radio56",
	"UAS_radio57"
];
