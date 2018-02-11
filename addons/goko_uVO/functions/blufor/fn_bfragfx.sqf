
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if !(_magazine in ["HandGrenade", "MiniGrenade"]) exitWith {};
	private _fragsounds = ["bfrag01", "bfrag02", "bfrag03", "bfrag04", "bfrag05", "bfrag06", "bfrag07", "bfrag08", "bfrag09", "bfrag10", "bfrag11", "bfrag12", "bfrag13", "bfrag14"];
	private _fragsound = selectRandom _fragsounds;
	[_shooter, [_fragsound, 250, 1]] remoteExec ["say3D", 0];
