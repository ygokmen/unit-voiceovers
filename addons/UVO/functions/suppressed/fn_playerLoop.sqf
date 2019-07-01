/*--------------------------------------------------------
Author: Gökmen
Modified FiredMan EH function for 'lazy suppression'
Calls suppressed function on target after necessarry checks.

Parameters:
["_shooter", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner", "_target"];

Return Value: -
----------------------------------------------------------*/
params ["_name", "_priority", "_effect", "_target", "_suppressionType", "_nationality", "_handle"];

_target setSuppression 0.3;
while {
	_handle = ppEffectCreate [_name, _priority];
	_handle < 0
} do {
	_priority = _priority + 1;
};

_handle ppEffectEnable true;
_handle ppEffectAdjust [getSuppression _target / 64, getSuppression _target / 64, true];
_handle ppEffectCommit 0.5;

waitUntil {
	private _saved = getSuppression _target;
	if (getSuppression _target < 0.01) exitWith { true; };

	_handle ppEffectAdjust [getSuppression _target / 64, getSuppression _target / 64, true];
	_handle ppEffectCommit 0.5;
	_target setSuppression (getSuppression _target - 0.05);

	systemchat format ["difference: %1 -- currentValue: %2", (getSuppression _target - _saved), getSuppression _target];
	sleep 0.5;
	false;
};
_target setSuppression 0;
_handle ppEffectEnable false;
hint "suppression effect ended";
ppEffectDestroy _handle;
