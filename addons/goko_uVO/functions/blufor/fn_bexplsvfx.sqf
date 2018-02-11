	
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if !(_magazine in ["SatchelCharge_Remote_Mag", "DemoCharge_Remote_Mag", "ATMine_Range_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag", "APERSTripMine_Wire_Mag", "ClaymoreDirectionalMine_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDLandBig_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandSmall_Remote_Mag"]) exitWith {};
	private _plantsounds = [ "bexpls01", "bexpls02", "bexpls03", "bexpls04", "bexpls05", "bexpls06", "bexpls07", "bexpls08", "bexpls09", "bexpls10", "bexpls11", "bexpls12", "bexpls13", "bexpls14"];
	private _plantsound = selectRandom _plantsounds;
	[_shooter, [_plantsound, 250, 1]] remoteExec ["say3D", 0];