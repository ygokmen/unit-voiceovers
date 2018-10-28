/*
	goko unit voice-overs addon wb/west base kill confirm. Called inside switch/killedEH of Unit
	author: gökmen
	website: https://github.com/the0utsider
	description: kill confirm, blufor. Code passed on this script via remote exec, gets global from here. instigator is the actual local unit
*/
params ["_unit", "_instigator"];

if (isPlayer _instigator && !goko_vo_konfirms) exitWith{};

/*	look for West side base class. */
_searchFriendly = (_instigator nearEntities [["SoldierEB"], 50]) - [_instigator];
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
		_soundSample = selectRandom ["otarget01", "otarget02", "otarget03", "otarget04", 
		"otarget05", "otarget06", "otarget07", "otarget08", "otarget09", "otarget10"];
		
		/*	calm kill confirm sounds beyond 200m range. */
		[_localActor, [_soundSample, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		[_localActor, true] remoteExec ["setRandomLip", 0];
	}
	else
	{
		_soundSample = selectRandom ["osupptarget01", "osupptarget02", "osupptarget03", "osupptarget04", "osupptarget05", 
		"osupptarget06", "osupptarget07", "osupptarget08", "osupptarget09", "osupptarget10"];
			
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
