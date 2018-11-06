/*--------------------------------------------------------
Authors: Gokmen, Sceptre
Class based init event handler script

Parameters:
0: The spawned unit <STRING>
1: Default nationality applied to unit <STRING>

Return Value:
Nothing
----------------------------------------------------------*/
params ["_unit","_defaultNationality"];

// UVO is handled where unit is local
if (local _unit) then {
	// Set unit nationality, also used as detection for Reload Statemachine
	if (!isNil "UVO_customNationalities") then {
		private _customNationality = UVO_customNationalities select {(_x # 0) == faction _unit};
		
		if !(_customNationality isEqualTo []) then {
			_unit setVariable ["UVO_unitNationality",(_customNationality # 0 # 1)];
		} else {
			_unit setVariable ["UVO_unitNationality",_defaultNationality];
		};
	} else {
		_unit setVariable ["UVO_unitNationality",_defaultNationality];
	};
	
	// Make it so unit can talk with UVO_fnc_globalSay3D
	_actor setVariable ["UVO_unitRandomLip",false];

	// Add necessary Event Handlers
	_unit addEventHandler ["Hit", {_this call UVO_fnc_hitEH}];
	_unit addeventhandler ["Fired", {_this call UVO_fnc_firedEH}];
	_unit addEventhandler ["Killed", {_this call UVO_fnc_killedEH}];
	_unit addEventhandler ["Reloaded", {_this call UVO_fnc_reloadedEH}];
};
