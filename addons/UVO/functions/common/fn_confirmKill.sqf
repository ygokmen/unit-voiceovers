/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Makes a killer call a confirmation phrase if possible

Parameters:
0: Killer unit <OBJECT>
1: Victim unit <OBJECT>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_victim"];

// Find nearby friendlies in 40 meter radius, only run if there are any
private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
if (_nearFriendlies isEqualTo []) exitWith {};

private _distance = _unit distance _victim;

[
	{
		params ["_unit","_distance"];

		private _unitNationality = _unit getVariable "UVO_unitNationality";

		if (_distance > 200) then {		
			// Calm kill confirm beyond 200m range
			[_unit,selectRandom (missionNamespace getVariable (format["UVO_targDownLo_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
		} else {
			// Dramatic kill confirm at close range
			[_unit,selectRandom (missionNamespace getVariable (format["UVO_targDownHi_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
		};
	},
	[_unit,_distance],
	(0.4 + (_distance * 0.0015)) // scale delay with distance
] call CBA_fnc_waitAndExecute;
