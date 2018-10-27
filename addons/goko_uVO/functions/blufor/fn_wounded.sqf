/*
	goko unit voice-overs addon hit EH function for blufor
	author: gökmen
	website: https://github.com/the0utsider
	description: Globally executes Say3D command on unit hit according to friend or foe
*/
params ["_unit", "_source", "_damage", "_instigator"];

/* prevent EH trigger more than once (penetrating multiple parts, explosion damage, etc.) */
_currentHealth = getDammage _unit;
if isNil {_unit getVariable "goko_var_lastDammage"} then {
	_unit setVariable ["goko_var_lastDammage", 0];
};
_storedHealth = _unit getVariable "goko_var_lastDammage";

if (_unit == _instigator || _currentHealth == _storedHealth) exitWith{};
if (_instigator iskindof "SoldierWB" && goko_vo_BLUFORcompatibility || faction _unit == faction _instigator) then
{
	_warnFF = selectRandom ["bwatchfire01", "bwatchfire02", "bwatchfire03", "bwatchfire04", "bwatchfire05",
	"bwatchfire06", "bwatchfire07", "bwatchfire08", "bwatchfire09", "bwatchfire10", "bwatchfire11", "bwatchfire12",
	"bwatchfire13", "bwatchfire14", "bwatchfire15"];
	
	[_unit, _warnFF] call gokovo_fnc_globalSay3d;
}
else
{
	_screamBulletWound = selectRandom ["bwounded01", "bwounded02", "bwounded03", "bwounded04", "bwounded05", "bwounded06",
	"bwounded07", "bwounded08", "bwounded09", "bwounded10", "bwounded11", "bwounded12", "bwounded13", "bwounded14",
	"bwounded15", "bwounded16", "bwounded17", "bwounded18", "bwounded19", "bwounded20", "bwounded21", "bwounded22",
	"bwounded23", "bwounded24", "bwounded25", "bwounded26", "bwounded27", "bwounded28", "bwounded29", "bwounded30",
	"bwounded31", "bwounded32", "bwounded33", "bwounded34", "bwounded35", "bwounded36", "bwounded37", "bwounded38",
	"bwounded39", "bwounded40", "bwounded41", "bwounded42", "bwounded43", "bwounded44", "bwounded45", "bwounded46",
	"bwounded47", "bwounded48", "bwounded49", "bwounded50", "bwounded51", "bwounded52"];
	
	[_unit, _screamBulletWound] call gokovo_fnc_globalSay3d;
};

_unit setVariable ["goko_var_lastDammage", _currentHealth];
