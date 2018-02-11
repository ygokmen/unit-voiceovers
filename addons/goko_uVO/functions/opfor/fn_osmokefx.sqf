
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	if !(_magazine in ["SmokeShellOrange", "SmokeShellBlue", "SmokeShellPurple", "SmokeShellYellow", "SmokeShellGreen", "SmokeShellRed", "SmokeShell"]) exitWith {};
	private _sounds = ["osmoke01", "osmoke02", "osmoke03", "osmoke04", "osmoke05", "osmoke06", "osmoke07", "osmoke08", "osmoke09"];
	private _sound = selectRandom _sounds;
	[_shooter, [_sound, 250, 1]] remoteExec ["say3D", 0];
	
	