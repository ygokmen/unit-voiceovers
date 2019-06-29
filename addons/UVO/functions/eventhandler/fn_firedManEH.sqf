/*--------------------------------------------------------
Author: Gökmen
FiredMan EH function for 'lazy suppression'
Calls suppressed function on target after necessarry checks.

Parameters:
See (https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#FiredMan)

Return Value: -
----------------------------------------------------------*/
params ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile","_gunner"];

private _objFiredUpon = [assignedTarget _unit,cursorTarget] select (isPlayer _unit);

if (CBA_MissionTime < _unit getVariable "UVO_suppressTimer" || {
	!alive _objFiredUpon || {
	!(_objFiredUpon isKindOf "Land") || {
	_weapon in ["Put","Throw",""]
}}}) exitWith {};

if (_objFiredUpon isKindOf "Car") then {
	private _aliveCrewMember = (crew vehicle _objFiredUpon) findIf {alive _x};
	if (_aliveCrewMember != -1)	then {
		_objFiredUpon = (crew vehicle _objFiredUpon) select _aliveCrewMember;
	} else {
		private _lookForNearbyCrew = _objFiredUpon nearEntities ["CAManBase",20];
		_objFiredUpon = selectRandom _lookForNearbyCrew;
	};
};

if (isNil "_objFiredUpon" || {
	CBA_MissionTime < _objFiredUpon getVariable "UVO_suppressedTimer" || {
	side _objFiredUpon isEqualTo side _unit
}}) exitWith {_unit setVariable ["UVO_suppressTimer",CBA_MissionTime + 10]};

[_unit,_objFiredUpon,_weapon,_ammo] call UVO_fnc_suppressed;
_unit setVariable ["UVO_suppressTimer",CBA_MissionTime + random 10 + random 10];
