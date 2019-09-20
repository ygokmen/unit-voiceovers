#include "script_component.hpp"

if (!isServer) exitWith {};

if (UAS_option_enableCough || UAS_option_enableSigh || UAS_option_enableWhistle) then {
	// Unit state machine
	private _unitStateMachine = [{allUnits select {_x getVariable ["UAS_active",false]}},true] call CBA_statemachine_fnc_create;
	[_unitStateMachine,{},{},{},"Standby"] call CBA_statemachine_fnc_addState;
	[_unitStateMachine,{},{},{},"Manifest"] call CBA_statemachine_fnc_addState;

	// Standby transitions
	if (UAS_option_enableCough) then {
		[_unitStateMachine,"Standby","Manifest",{
			CBA_missionTime > (_this getVariable ["UAS_intervalCough",CBA_missionTime + 1])
		},{_this setVariable ['UAS_manifest',0];},"Cough"] call CBA_statemachine_fnc_addTransition;
	};

	if (UAS_option_enableSigh) then {
		[_unitStateMachine,"Standby","Manifest",{
			CBA_missionTime > (_this getVariable ["UAS_intervalSigh",CBA_missionTime + 1])
		},{_this setVariable ['UAS_manifest',1];},"Sigh"] call CBA_statemachine_fnc_addTransition;
	};

	if (UAS_option_enableWhistle) then {
		[_unitStateMachine,"Standby","Manifest",{
			CBA_missionTime > (_this getVariable ["UAS_intervalWhistle",CBA_missionTime + 1])
		},{_this setVariable ['UAS_manifest',2];},"Whistle"] call CBA_statemachine_fnc_addTransition;
	};

	// Manifest transitions
	[_unitStateMachine,"Manifest","Standby",{true},{_this call FUNC(manifestUnit);},"Return"] call CBA_statemachine_fnc_addTransition;
};

if (UAS_option_enableRadio) then {
	// Group state machine
	private _groupStateMachine = [{allGroups select {_x getVariable ["UAS_active",false]}},true] call CBA_statemachine_fnc_create;
	[_groupStateMachine,{},{},{},"Standby"] call CBA_statemachine_fnc_addState;
	[_groupStateMachine,{},{},{},"Manifest"] call CBA_statemachine_fnc_addState;

	// Standby transitions
	[_groupStateMachine,"Standby","Manifest",{
		CBA_missionTime > (_this getVariable ["UAS_intervalRadio",CBA_missionTime + 1])
	},{_this setVariable ['UAS_manifest',0];},"Radio"] call CBA_statemachine_fnc_addTransition;

	// Manifest transitions
	[_groupStateMachine,"Manifest","Standby",{true},{_this call FUNC(manifestGroup);},"Return"] call CBA_statemachine_fnc_addTransition;
};
