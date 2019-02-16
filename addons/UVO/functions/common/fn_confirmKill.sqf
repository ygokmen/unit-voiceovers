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

// Only run if there are friendlies in 40 meter radius
private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
if (_nearFriendlies isEqualTo []) exitWith {};

private _distance = _unit distance _victim;

[{
	params ["_unit","_distance"];

	private _nationality = _unit getVariable "UVO_nationality";

	if (_distance > 200) then {		
		// Calm kill confirm beyond 200m range
		[_unit,selectRandom (missionNamespace getVariable (format["UVO_targDownLo_%1",_nationality]))] call UVO_fnc_globalSay3D;
	} else {
		// Dramatic kill confirm at close range
		[_unit,selectRandom (missionNamespace getVariable (format["UVO_targDownHi_%1",_nationality]))] call UVO_fnc_globalSay3D;
	};
},[_unit,_distance],0.4 + (_distance * 0.0015)] call CBA_fnc_waitAndExecute;
