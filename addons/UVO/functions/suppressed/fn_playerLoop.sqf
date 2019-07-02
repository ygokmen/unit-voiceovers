/*--------------------------------------------------------
Author: Gökmen
Simple loop with PP effect synched with current suppression of player.
* Suppression will be forced reset to 0 when player is in vehicle's gunner or driver seat (engine behavior).
* Destroyed vehicle will set player suppress value to 1 (when on passenger seat)

Parameters:
["_name", "_priority", "_effect", "_target", "_munition # 1", "_handle"];

Return Value: -
----------------------------------------------------------*/
params ["_name", "_priority", "_effect", "_target", "_InitSuppressionValue", "_handle"];

_target setSuppression _InitSuppressionValue;

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

	if ((getSuppression _target) < 0.05) exitWith { true; };
	_handle ppEffectAdjust [getSuppression _target / 64, getSuppression _target / 64, true];
	_handle ppEffectCommit 0.5;

	_target setSuppression ((getSuppression _target min 1) - 0.05); //limit end value to 0.95
	
	systemchat format ["difference: %1 -- currentValue: %2", (getSuppression _target - _saved), getSuppression _target];
	sleep 0.5;
	false;
};

_target setSuppression 0;
_handle ppEffectEnable false;
hint "suppression effect ended";
ppEffectDestroy _handle;
