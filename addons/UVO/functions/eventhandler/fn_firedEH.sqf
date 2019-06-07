/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Fired event handler script. Calls grenade, charge and reloading phrases

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#Fired)

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];

if (isPlayer _unit && !UVO_option_clientEnabled) exitWith {};

private _nationality = _unit getVariable "UVO_nationality";

if (_weapon in ["Throw","Put"]) then {
	private _type = switch true do {
		case (_magazine in UVO_fragTypes) : {
			[{_this call UVO_fnc_thrownFrag;},[_projectile,side group _unit],0.5] call CBA_fnc_waitAndExecute;
			"frag"
		};
		case (_magazine in UVO_smokeTypes) : {"smoke"};
		case (_magazine in UVO_flashTypes) : {"flash"};
		case (_magazine in UVO_incendiaryTypes) : {"incendiary"};
		case (_magazine in UVO_explosiveTypes) : {"explosive"};
		default {""};
	};
	if (_type isEqualTo "") exitWith {};

	// Only run if there are friendlies in 40 meter radius
	private _nearFriendlies = ((_unit nearEntities [["CAManBase"],40]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
	if (_nearFriendlies isEqualTo []) exitWith {};

	// Say appropriate phrase depending on _type
	[_unit,selectRandom (missionNamespace getVariable format ["UVO_%1_%2",_type,_nationality])] call UVO_fnc_globalSay3D;
} else {
	// Stop if the magazine still has ammo in the mag
	if (_weapon isEqualTo _muzzle && _unit ammo _muzzle != 0) exitWith {};

	// Stop if unit is out of mags for current weapon
	if ((_weapon call CBA_fnc_compatibleMagazines) arrayIntersect (magazines _unit) isEqualTo []) exitWith {};

	// Only run if there are friendlies in 25 meter radius
	private _nearFriendlies = ((_unit nearEntities [["CAManBase"],25]) - [_unit]) select {(side group _unit) getFriend (side group _x) >= 0.6};
	if (_nearFriendlies isEqualTo []) exitWith {};

	if (isPlayer _unit)	then {
		// If unit is a player, Creat PFH to check when player reloads or changes weapon.
		[{
			params ["_args","_PFHID"];
			_args params ["_unit","_muzzle","_nationality"];
			
			if (inputAction "reloadMagazine" > 0) exitwith {
				_PFHID call CBA_fnc_removePerFrameHandler;
				[_unit,selectRandom (missionNamespace getVariable format ["UVO_reloading_%1",_nationality])] call UVO_fnc_globalSay3D;
			};

			if (!alive _unit || currentMuzzle _unit != _muzzle) exitWith {
				_PFHID call CBA_fnc_removePerFrameHandler;
			};
		},0,[_unit,_muzzle,_nationality]] call CBA_fnc_addPerFrameHandler;
	} else {
		// If the unit is an AI, go ahead and make him say 'reloading'
		[_unit,selectRandom (missionNamespace getVariable format ["UVO_reloading_%1",_nationality])] call UVO_fnc_globalSay3D;
	};
};
