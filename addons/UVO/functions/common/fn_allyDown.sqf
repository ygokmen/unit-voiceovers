/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Selects valid nearby friendly from an array of nearby friendlies and makes him say "friendly down."

Parameters:
0: Array of nearby friendlies <ARRAY>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_nearFriendlies"];

// If players aren't supposed to use UVO then removed them from selection
if (!UVO_option_clientEnabled && {(_nearFriendlies findIf {isPlayer _x}) != -1}) then {
	_nearFriendlies = _nearFriendlies - (_nearFriendlies select {isPlayer _x});
};
if (_nearFriendlies isEqualTo []) exitWith {};

// Select friendly unit that can say shit -- also checks for 'spam filter'
private _friendlyUnit = selectRandom (_nearFriendlies select {
	alive _x && !(_x getVariable ["ACE_isUnconscious",false]) && {!isNil {_x getVariable "UVO_unitNationality"} && !(_x getVariable ["UVO_allyDownSpamFilter",false])}
});
if (isNil "_friendlyUnit") exitWith {};

// 90% chance to set a 1 sec 'spam filter' variable on near friendlies.
{
	if (random 1 < 0.9) then {
		_x setVariable ["UVO_allyDownSpamFilter",true];
	};
	true
} count _nearFriendlies;

[
	{
		{
			_x setVariable ["UVO_allyDownSpamFilter",nil];
			true
		} count _this;
	},_nearFriendlies,1
] call CBA_fnc_waitAndExecute;

// Finish up
private _unitNationality = _friendlyUnit getVariable "UVO_unitNationality";
[_friendlyUnit,(selectRandom (missionNamespace getVariable (format["UVO_allyDown_%1",_unitNationality])))] call UVO_fnc_globalSay3D;
