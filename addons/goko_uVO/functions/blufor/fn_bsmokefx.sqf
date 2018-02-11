
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];

	if !(_magazine in ["SmokeShellOrange", "SmokeShellBlue", "SmokeShellPurple", "SmokeShellYellow", "SmokeShellGreen", "SmokeShellRed", "SmokeShell"]) exitWith {};
	private _smokesounds = ["bsmoke01", "bsmoke02", "bsmoke03", "bsmoke04", "bsmoke05", "bsmoke06", "bsmoke07", "bsmoke08", "bsmoke09"];
	private _smokesound = selectRandom _smokesounds;
	[_shooter, [_smokesound, 250, 1]] remoteExec ["say3D", 0];
