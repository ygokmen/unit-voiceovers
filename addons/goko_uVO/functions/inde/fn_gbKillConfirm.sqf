/*
	goko unit voice-overs addon wb/west base kill confirm. Called inside switch/killedEH of Unit
	author: gökmen
	website: https://github.com/the0utsider
	description: kill confirm, blufor. Code passed on this script via remote exec, gets global from here. instigator is the actual local unit
*/
params ["_unit", "_instigator"];

if (isPlayer _instigator && !goko_vo_konfirms) exitWith{};

/*	look for West side base class. */
_searchFriendly = (_instigator nearEntities [["soldierGB"], 50]) - [_instigator];
if (isnil {_searchFriendly #0}) exitWith {};
/*	Leave If there are no friendlies in radius or if unit already talking. */
isTalking = _instigator getVariable ["gokovo_var_randomLip", false];
if (inputAction "pushToTalk" > 0 || isTalking ) exitWith{};

/*	start random lip simulation and spawn thread */
_instigator setVariable ["gokovo_var_randomLip", true];
_null = _this spawn {
	_victim = _this select 0;
	_localActor = _this select 1;
	waitUntil {
		sleep (0.4 + random 2.6);
		true; 
	};
	/*	find distance of unit. */
	if ((_localActor distance _victim) > 200) then
	{
		_soundSample = selectRandom ["intarget01", "intarget02", "intarget03", "intarget04", 
		"intarget05", "intarget06", "intarget07", "intarget08", "intarget09", "intarget10"];
		
		/*	calm kill confirm sounds beyond 200m range. */
		[_localActor, [_soundSample, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		[_localActor, true] remoteExec ["setRandomLip", 0];
	}
	else
	{
		_soundSample = selectRandom ["insupptarget01", "insupptarget02", "insupptarget03", "insupptarget04", 
		"insupptarget05", "insupptarget06", "insupptarget07", "insupptarget08", "insupptarget09", "insupptarget10"];
		
		/*	dramatic, panicked kill confirm sound samples at close range. */
		[_localActor, [_soundSample, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		[_localActor, true] remoteExec ["setRandomLip", 0];
	};
	waitUntil {
		sleep (1 + random 1);
		true;
	};
	/*	stop broadcast random lip simulation. */
	_localActor setVariable ["gokovo_var_randomLip", false];
	[_localActor, false] remoteExec ["setRandomLip", 0];
};
