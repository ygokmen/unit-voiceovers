
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	if !(_magazine in ["SatchelCharge_Remote_Mag", "DemoCharge_Remote_Mag", "ATMine_Range_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag", "APERSTripMine_Wire_Mag", "ClaymoreDirectionalMine_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDLandBig_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandSmall_Remote_Mag"]) exitWith {};
	private _sounds = [ "oexpls01", "oexpls02", "oexpls03", "oexpls04", "oexpls05", "oexpls06", "oexpls07", "oexpls08", "oexpls09", "oexpls10", "oexpls11", "oexpls12", "oexpls13", "oexpls14", "oexpls15", "oexpls16", "oexpls17"];
	private _sound = selectRandom _sounds;
	[_shooter, [_sound, 250, 1]] remoteExec ["say3D", 0];