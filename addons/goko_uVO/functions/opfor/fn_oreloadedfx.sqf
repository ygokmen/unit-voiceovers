	params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];
	
	if (_weapon in ["Throw", "put"]) exitWith {};

	_clipcounter = {
	_x == currentMagazine _unit
	}count (magazines _unit);
	
	if(_clipcounter < 1) then {
	
	private _sounds = ["olowammo01", "olowammo02", "olowammo03", "olowammo04", "olowammo05"];
	private _sound = selectRandom _sounds;
	[_unit, [_sound, 300, 1]] remoteExec ["say3D", 0];
	} else {
	
	_null = (_this select 0) spawn {
	sleep 1;
	waitUntil {
	if (needreload _this == 1) exitWith {true}; 

	false //<-- boolean at the end of the scope 
	};

	
		private _rsounds = [
						"orel01",
						"orel02",
						"orel03",
						"orel04",
						"orel05",
						"orel06",
						"orel07",
						"orel08",
						"orel09",
						"orel10",
						"orel11",
						"orel12",
						"orel13",
						"orel14",
						"orel15",
						"orel16",
						"orel17",
						"orel18",
						"orel19",
						"orel20",
						"orel21",
						"orel22",
						"orel23",
						"orel24",
						"orel25",
						"orel26",
						"orel27",
						"orel28",
						"orel29",
						"orel30"
						];
		private _rsound = selectRandom _rsounds;
		[_this, [_rsound, 300, 1]] remoteExec ["say3D", 0]; 
		};
	};