params ["_unit","_victim"];

// Stop here if killer is dead or no nationality is defined
private _unitNationality = _unit getVariable "UVO_unitNationality";
if (!alive _unit || isNil "_unitNationality") exitWith {};

// Find nearby friendlies in 50 meter radius
private _nearFriendlies = ((_unit nearEntities [["Man"], 50]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};

// Stop if there aren't nearby friendlies
if !(_nearFriendlies isEqualTo []) exitWith {};

// How far away is the killer/victim?
private _distance = _unit distance _victim;

// Do the rest after a small delay for realism
[
	{
		params ["_unit","_unitNationality","_victim","_distance"];

		if (_distance > 200) then {		
			// Calm kill confirm sounds beyond 200m range
			[_unit,selectRandom (missionNamespace getVariable (format["UVO_targDownLo_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
		} else {
			// Dramatic kill confirm sounds at close range
			[_unit,selectRandom (missionNamespace getVariable (format["UVO_targDownHi_%1",_unitNationality]))] call UVO_fnc_globalSay3d;
		};
	},
	[_unit,_unitNationality,_victim,_distance],
	(0.4 + (_distance * 0.0015)) // scale delay with distance
] call CBA_fnc_waitAndExecute;
