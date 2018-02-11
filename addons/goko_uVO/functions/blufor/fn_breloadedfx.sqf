	params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];
	
	if (_weapon in ["Throw", "", "put"]) exitWith {};
	
	_null = (_this select 0) spawn {
	_r = [0]; 
	
	waitUntil { 
	if (needreload _this == 1) exitWith {true}; 
	_r = needreload _this; 
	false //<-- boolean at the end of the scope 
	}; 
		private _rsounds = [
						"brel01",
						"brel02",
						"brel03",
						"brel04",
						"brel05",
						"brel06",
						"brel07",
						"brel08",
						"brel09",
						"brel10",
						"brel11",
						"brel12",
						"brel13",
						"brel14",
						"brel15",
						"brel16",
						"brel17",
						"brel18",
						"brel19",
						"brel20",
						"brel21",
						"brel22",
						"brel23",
						"brel24",
						"brel25",
						"brel26",
						"brel27",
						"brel28",
						"brel29",
						"brel30",
						"brel31"
						];
		private _rsound = selectRandom _rsounds;
		[_this, [_rsound, 300, 1]] remoteExec ["say3D", 2]; 
	}; 

	
	_clipcounter = {
	_x == currentMagazine _unit
	}count (magazines _unit);
	
	if(_clipcounter >= 1) exitWith {};
	
	private _sounds = ["blowammo01", "blowammo02", "blowammo03", "blowammo04", "blowammo05", "blowammo06"];
	private _sound = selectRandom _sounds;
	[_unit, [_sound, 400, 1]] remoteExec ["say3D", 0];