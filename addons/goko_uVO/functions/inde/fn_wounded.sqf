/*
	goko unit voice-overs addon hit EH function for independent
	author: gökmen
	website: https://github.com/the0utsider
	description: Globally executes Say3D command on unit hit according to friend or foe
*/

params ["_unit", "_source", "_damage", "_instigator"];

isTalking = _unit getVariable ["gokovo_var_randomLip", false];
if (_unit == _instigator || isTalking || _damage > 0.9) exitWith{};

if (_instigator iskindof "SoldierGB" && goko_vo_INDIcompatibility || faction _unit == faction _instigator) then
{
	_warnFF = selectRandom ["inwatchfire01", "inwatchfire02", "inwatchfire03", 
	"inwatchfire04", "inwatchfire05", "inwatchfire06", "inwatchfire07", 
	"inwatchfire08","inwatchfire09", "inwatchfire10", "inwatchfire11"];
	
	[_unit, _warnFF] call gokovo_fnc_globalSay3d;
}
else
{
	_screamBulletWound = selectRandom ["inwounded01", "inwounded02", "inwounded03", 
	"inwounded04", "inwounded05", "inwounded06", "inwounded07", "inwounded08", 
	"inwounded09", "inwounded10", "inwounded11", "inwounded12", "inwounded13", 
	"inwounded14", "inwounded15", "inwounded16", "inwounded17", "inwounded18", 
	"inwounded19", "inwounded20", "inwounded21", "inwounded22", "inwounded23", 
	"inwounded24", "inwounded25", "inwounded26", "inwounded27", "inwounded28", 
	"inwounded29", "inwounded30", "inwounded31", "inwounded32", "inwounded33", 
	"inwounded34", "inwounded35", "inwounded36", "inwounded37", "inwounded38", 
	"inwounded39", "inwounded40", "inwounded41", "inwounded42", "inwounded43", 
	"inwounded44", "inwounded45", "inwounded46", "inwounded47", "inwounded48", 
	"inwounded49", "inwounded50", "inwounded51", "inwounded52", "inwounded53", 
	"inwounded54", "inwounded55", "inwounded56", "inwounded57", "inwounded58", 
	"inwounded59"];
	
	[_unit, _screamBulletWound] call gokovo_fnc_globalSay3d;
};
