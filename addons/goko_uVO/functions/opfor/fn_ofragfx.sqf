
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	if !(_magazine in ["HandGrenade", "MiniGrenade"]) exitWith {};
	private _sounds = ["ofrag01", "ofrag02", "ofrag03", "ofrag04", "ofrag05", "ofrag06", "ofrag07", "ofrag08", "ofrag09", "ofrag10", "ofrag11", "ofrag12", "ofrag13", "ofrag14"];
	private _sound = selectRandom _sounds;
	[_shooter, [_sound, 250, 1]] remoteExec ["say3D", 0];