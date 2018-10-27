/*
	goko unit voice-overs addon hit EH function for opfor
	author: gökmen
	website: https://github.com/the0utsider
	description: Globally executes Say3D command on unit hit according to friend or foe
*/
params ["_unit", "_source", "_damage", "_instigator"];

isTalking = _unit getVariable ["gokovo_var_randomLip", false];
if (_unit == _instigator || isTalking || _damage > 0.9) exitWith{};

if (_instigator iskindof "SoldierEB" && goko_vo_OPFORcompatibility || faction _unit == faction _instigator) then
{
	_warnFF = selectRandom ["owatchfire01", "owatchfire02", "owatchfire03", "owatchfire04", "owatchfire05", 
	"owatchfire06", "owatchfire07", "owatchfire08","owatchfire09", "owatchfire10", "owatchfire11"];
	
	[_unit, _warnFF] call gokovo_fnc_globalSay3d;
}
else
{
	_screamBulletWound = selectRandom ["owounded01", "owounded02", "owounded03", "owounded04", "owounded05", 
	"owounded06", "owounded07", "owounded08", "owounded09", "owounded10", "owounded11", "owounded12", "owounded13", 
	"owounded14", "owounded15", "owounded16", "owounded17", "owounded18", "owounded19", "owounded20", "owounded21", 
	"owounded22", "owounded23", "owounded24", "owounded25", "owounded26", "owounded27", "owounded28", "owounded29", 
	"owounded30", "owounded31", "owounded32", "owounded33", "owounded34", "owounded36", "owounded37", "owounded38", 
	"owounded39", "owounded40", "owounded41", "owounded42", "owounded43", "owounded44", "owounded45", "owounded46", 
	"owounded47", "owounded48", "owounded49", "owounded50", "owounded51", "owounded52", "owounded53", "owounded54", 
	"owounded55", "owounded56", "owounded57", "owounded58", "owounded59"];
	
	[_unit, _screamBulletWound] call gokovo_fnc_globalSay3d;
};
