/*-----------------------------------------------------------------------------------------------//
Authors: Sceptre, Gokmen
Function for ambient radio sounds

Parameters:
0: Group

Return Value:
Nothing
//-----------------------------------------------------------------------------------------------*/
params ["_group"];

private _radioSound = selectRandom UAS_radioSounds;
private _fnc_playRadio = {
	params ["_unit","_radioSound"];
	private _soundDummy = createVehicle ["#particlesource",getPos _unit,[],0,"CAN_COLLIDE"];
	_soundDummy attachTo [_unit,[0,0,0]];
	private _distance = [UAS_option_maxDistRadioInVehicle,UAS_option_maxDistRadio] select (_unit in _unit);
	[_soundDummy,[_radioSound,_distance]] remoteExec ["say3D",0];
	[{deleteVehicle _this;},_soundDummy,10] call CBA_fnc_waitAndExecute;
};

switch (UAS_option_groupRadio) do {
	// Leader only
	case 0 : {
		private _leader = leader _group;
		if ((isPlayer _leader && (UAS_option_disableOnPlayers || UAS_option_disableRadioOnPlayers)) || isNull _leader || behaviour _leader == "STEALTH") exitWith {};
		[_leader,_radioSound] call _fnc_playRadio;
	};
	// Random unit
	case 1 : {
		private _units = (units _group) select {!isNull _x && behaviour _x != "STEALTH"};
		if ((UAS_option_disableOnPlayers || UAS_option_disableRadioOnPlayers) && {(_units findIf {isPlayer _x}) != -1}) then {
			_units = _units - (_units select {isPlayer _x});
		};
		if (_units isEqualTo []) exitWith {};

		private _operator = selectRandom _units;
		[_operator,_radioSound] call _fnc_playRadio;
	};
	// Units with 'UAS_radioOperator' variable
	case 2 : {
		private _units = (units _group) select {!isNull _x && behaviour _x != "STEALTH" && _x getVariable ["UAS_radioOperator",false]};
		if ((UAS_option_disableOnPlayers || UAS_option_disableRadioOnPlayers) && {(_units findIf {isPlayer _x}) != -1}) then {
			_units = _units - (_units select {isPlayer _x});
		};
		if (_units isEqualTo []) exitWith {};

		{
			[_x,_radioSound] call _fnc_playRadio;
			false
		} count _units;
	};
};
