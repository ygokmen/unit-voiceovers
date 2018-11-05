if(is3DEN) exitWith {};

params ["_unit","_unitNationality"];

// UVO is handled where unit is local
if (local _unit) then 
{
	// Only allow combative sides
	private _side = side _unit;
	if !(_side == west || _side == east || _side == resistance) exitWith {};

	// Set nationality based off soldier class, also used as detection for Reload Statemachine
	_unit setVariable ["UVO_unitNationality",_unitNationality];

	// Make it so unit can talk with UVO_fnc_globalSay3D
	_actor setVariable ["UVO_unitRandomLip",false];

	// Add necessary Event Handlers
	_unit addEventHandler ["Hit", {_this call UVO_fnc_hitEH}];
	_unit addeventhandler ["Fired", {_this call UVO_fnc_firedEH}];
	_unit addEventhandler ["Killed", {_this call UVO_fnc_killedEH}];
	_unit addEventhandler ["Reloaded", {_this call UVO_fnc_reloadedEH}];
};
