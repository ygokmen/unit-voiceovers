/*--------------------------------------------------------
Author: Gökmen
Modified FiredMan EH function for 'lazy suppression' (clean version)

Parameters:
["_shooter", "_target", "_weapon", "_ammo"];

Return Value: -
----------------------------------------------------------*/
params 	["_shooter", "_target", "_weapon", "_ammo"];

if (_target iskindof "LandVehicle") then {
	private _dudesNearby = _target nearEntities ["CAManBase", 20];
	if !(_dudesNearby isEqualTo []) then {
		_target = selectRandom _dudesNearby;
	} else { _target = selectRandom (crew vehicle _target); };
};

if (isNil{_target getVariable "UVO_suppressedTimer"}
		||
	{_weapon in ["Put", "Throw", ""]
		||
	{!alive _target}}
) exitWith { _shooter setVariable ["UVO_suppressTimer", cba_missiontime + 10]; };

if (isPlayer _target) then {
	/* entry point for mod compatibility (visual post-process efx):
	getsuppression return 0 on players. Will be using this check later on
	while incrementing supression on player artificially with the PP effect. */
	if (cba_missiontime < _target getVariable "UVO_suppressedTimer"
		&&
	{getSuppression _target isEqualTo 0}) exitWith { systemchat "exit trace1"; };
	_shooter setVariable ["UVO_suppressTimer", cba_missiontime + 1];
	[
		_shooter,
		_target,
		_weapon,
		_ammo
	] call uvo_fnc_targetIsPlayer;
} else {
	if (cba_missiontime < _target getVariable "UVO_suppressedTimer") exitWith {};
	_shooter setVariable ["UVO_suppressTimer", cba_missiontime + 10];
	[
		_shooter,
		_target,
		_weapon,
		_ammo
	] call uvo_fnc_targetIsAI;
};
