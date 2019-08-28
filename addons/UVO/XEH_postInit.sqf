if (hasInterface) then {
	[
		"Unit Voice-Overs",
		"UVO_callout",
		["Say directional enemy callout","(DEFAULT: T)"],
		{[player] call UVO_fnc_calloutDir; false},
		{false},[0x14,[false,false,false]],false
	] call CBA_fnc_addKeybind;
};

UVO_projectileList = [];
UVO_projectileNullIndexes = [];
UVO_projectileIndex = 0;

[{
	private _list = UVO_projectileList;
	if (_list isEqualTo []) exitWith {};

	private _index = UVO_projectileIndex;
	if (_index >= count _list) then {
		if !(UVO_projectileNullIndexes isEqualTo []) then {
			{_list deleteAt _x; false} count UVO_projectileNullIndexes;
			UVO_projectileList = _list;
			UVO_projectileNullIndexes = [];
		};

		_index = 0;
	};

	UVO_projectileIndex = _index + 1;

	(_list # _index) params ["_projectile","_isRocket","_buffer"];

	if (isNull _projectile) exitWith {UVO_projectileNullIndexes pushBack _index;};

	if (_isRocket) then {
		if (CBA_missionTime < _buffer) exitWith {};

		private _dir = getDir _projectile;
		private _units = ((_projectile getPos [115,_dir] nearEntities ["CAManBase",30]) + (_projectile getPos [65,_dir] nearEntities ["CAManBase",30])) select {!isNil {_x getVariable "UVO_nationality"}};
		if (_units isEqualTo []) exitWith {};

		(UVO_projectileList select _index) set [2,CBA_missionTime + 0.6 + random 0.1];

		private _target = selectRandom _units;
		[_target,"rocket"] remoteExec ["UVO_fnc_suppressed",_target];
	} else {
		if (CBA_missionTime < _buffer) exitWith {};

		private _units = (_projectile getPos [10,getDir _projectile] nearEntities ["CAManBase",6]) select {!isNil {_x getVariable "UVO_nationality"}};
		if (_units isEqualTo []) exitWith {};

		(UVO_projectileList select _index) set [2,CBA_missionTime + 0.06 + random 0.1];

		private _target = selectRandom _units;
		[_target,"bullet"] remoteExec ["UVO_fnc_suppressed",_target];
	};
},0,[]] call CBA_fnc_addPerFrameHandler;
