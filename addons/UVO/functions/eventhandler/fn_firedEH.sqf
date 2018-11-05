params ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

if ((isPlayer _unit && !UVO_option_clientEnabled) || !(_weapon in ["Throw", "Put"])) exitWith {};

// Get unit's nationality
private _unitNationality = _unit getVariable "UVO_unitNationality";

// Determine what type of grenade is used (or if it's a charge)
switch (true) do {
	case (_magazine in UVO_fragTypes) : {
		[_unit,selectRandom (missionNamespace getVariable (format ["UVO_frag_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
		[{_this call UVO_fnc_thrownFrag;},[_projectile,side group _unit],0.5] call CBA_fnc_waitAndExecute;
	};
	case (_magazine in UVO_smokeTypes) : {
		[_unit,selectRandom (missionNamespace getVariable (format ["UVO_smoke_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
	};
	case (_magazine in UVO_flashTypes) : {
		[_unit,selectRandom (missionNamespace getVariable (format ["UVO_flash_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
	};
	case (_magazine in UVO_incendiaryTypes) : {
		[_unit,selectRandom (missionNamespace getVariable (format ["UVO_incendiary_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
	};
	case (_magazine in UVO_explosiveTypes) : {
		[_unit,selectRandom (missionNamespace getVariable (format ["UVO_explosive_%1",_unitNationality]))] call UVO_fnc_globalSay3D;
	};
};
