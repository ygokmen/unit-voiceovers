goko_fnc_b_acem84 = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	
	if !(_magazine in ["ACE_M84"]) exitWith {};
	_baceflashsounds = 
	[
		"bflash01",
		"bflash02",
		"bflash03",
		"bflash04",
		"bflash05",
		"bflash06",
		"bflash07"
	];
	_baceflashsound = selectRandom _baceflashsounds;
	[_shooter, [_baceflashsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	[_shooter] remoteExecCall ["goko_fnc_movelips"];
};

goko_fnc_b_aceM14 = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	if !(_magazine in ["ACE_M14"]) exitWith {};
	_baceincendierysounds = 
	[
		"bIncgren01",
		"bIncgren02",
		"bIncgren03",
		"bIncgren04",
		"bIncgren05",
		"bIncgren06",
		"bIncgren07"
	];
	_baceincendierysound = selectRandom _baceincendierysounds;
	[_shooter, [_baceincendierysound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	[_shooter] remoteExecCall ["goko_fnc_movelips"];
};

goko_fnc_bexplosvfx = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	if !(_magazine in ["SatchelCharge_Remote_Mag", "DemoCharge_Remote_Mag", "ATMine_Range_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag", "APERSTripMine_Wire_Mag", "ClaymoreDirectionalMine_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDLandBig_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandSmall_Remote_Mag"]) exitWith {};
	 _plantsounds = 
	 [
		"bexpls01",
		"bexpls02",
		"bexpls03",
		"bexpls04",
		"bexpls05",
		"bexpls06",
		"bexpls07",
		"bexpls08",
		"bexpls09",
		"bexpls10",
		"bexpls11",
		"bexpls12",
		"bexpls13", 
		"bexpls14"
	];
	_plantsound = selectRandom _plantsounds;
	[_shooter, [_plantsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	[_shooter] remoteExecCall ["goko_fnc_movelips"];
};

goko_fnc_bfragfx = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	if !(_magazine in ["HandGrenade", "MiniGrenade"]) exitWith {};
	_fragsounds = 
	[
		"bfrag01", 
		"bfrag02", 
		"bfrag03", 
		"bfrag04", 
		"bfrag05", 
		"bfrag06", 
		"bfrag07", 
		"bfrag08", 
		"bfrag09", 
		"bfrag10", 
		"bfrag11", 
		"bfrag12", 
		"bfrag13", 
		"bfrag14"
	];
	_fragsound = selectRandom _fragsounds;
	[_shooter, [_fragsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	[_shooter] remoteExecCall ["goko_fnc_movelips"];
	
	_null = _this spawn 
	{
		_frag = _this select 6; 
		waitUntil 
		{
			_mspeed = velocity _frag select 2; 

			sleep 0.7;
			if (_mspeed < 0.0001) exitWith {true};
		};
		
		_findnearby = _frag nearEntities [["I_Soldier_base_F", "O_Soldier_base_F"], 16];
		if (_findnearby isequalto []) exitwith{};
		_nearby = selectRandom _findnearby; 
		_cansee = [objNull, "ifire"] checkVisibility [getposasl _frag, eyePos _nearby];

		
		if (_cansee != 0) then
		{
			if (side _nearby == independent) then 
			{
				_inspottedfrag = ["Inspotnade01", "Inspotnade02", "Inspotnade03", "Inspotnade04", "Inspotnade05", "Inspotnade06", "Inspotnade07", "Inspotnade08", "Inspotnade09", "Inspotnade10", "Inspotnade11", "Inspotnade12", "Inspotnade13", "Inspotnade14", "Inspotnade15", "Inspotnade16", "Inspotnade17", "Inspotnade18"];
				_infrag = selectRandom _inspottedfrag;

				[_nearby, [_infrag, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
			};
			
			if (side _nearby == east) then 
			{
				_ospottedfrag = ["ospotnade01", "ospotnade02", "ospotnade03", "ospotnade04", "ospotnade05", "ospotnade06", "ospotnade07", "ospotnade08", "ospotnade09", "ospotnade10", "ospotnade11", "ospotnade12", "ospotnade13", "ospotnade14", "ospotnade15", "ospotnade16", "ospotnade17", "ospotnade18", "ospotnade19", "ospotnade20", "ospotnade21", "ospotnade22", "ospotnade23"];
				_ofrag = selectRandom _ospottedfrag;

				[_nearby, [_ofrag, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
			};
		};
	};
};

goko_fnc_bsmokefx = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	if !(_magazine in ["SmokeShellOrange", "SmokeShellBlue", "SmokeShellPurple", "SmokeShellYellow", "SmokeShellGreen", "SmokeShellRed", "SmokeShell"]) exitWith {};
	 _smokesounds = 
	 [
		"bsmoke01", 
		"bsmoke02", 
		"bsmoke03", 
		"bsmoke04", 
		"bsmoke05", 
		"bsmoke06", 
		"bsmoke07", 
		"bsmoke08", 
		"bsmoke09"
	];
	 _smokesound = selectRandom _smokesounds;
	[_shooter, [_smokesound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	[_shooter] remoteExecCall ["goko_fnc_movelips"];
};

goko_fnc_breloadedfx = 
{
	params ["_unit", "_weapon", "_muzzle", "_newmag", "_oldmag"];
	
	if ((hasinterface && !goko_vo_playeronoffswitch) || _weapon != _muzzle || !isnil "ace_arsenal_camera" || !isnil "RSCDisplayArsenal") exitWith {}; 
	if !(isNil (_unit getVariable "Achilles_var_suppressiveFire_ready") && (_unit getVariable "Achilles_var_suppressiveFire_ready")) exitWith {}; 

	private _countMagz = {
	_x == currentMagazine _unit
	}count (magazines _unit);
	
	if (_countMagz != 0) then 
	{
		_null = _this spawn 
		{
			_rsounds = 
			[
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

			_duder = _this select 0;
			_dudermuzzle = _this select 2;
			private _storeMagID = if (currentMagazineDetail _duder isEqualTo "") then {""} else  
			{currentMagazineDetail _duder splitString "[]:/" select 4};  
			_chamber = 999;
			
			waitUntil 
			{
				sleep 1;
				_chamber = _duder ammo _dudermuzzle;
				private _checkMagIDs = if (currentMagazineDetail _duder isEqualTo "") then {""} else  
				{currentMagazineDetail _duder splitString "[]:/" select 4};  
				if (_chamber == 0 || _storeMagID != _checkMagIDs || !alive _duder) exitWith {true};
				false //<-- boolean at the end of the scope
			};
			if !(alive _duder) exitWith {};
			
			_checkMagIDs = if (currentMagazineDetail _duder isEqualTo "") then {""} else  
			{currentMagazineDetail _duder splitString "[]:/" select 4};  
			if (_storeMagID != _checkMagIDs) exitWith {};
			
			_rsound = selectRandom _rsounds;
			[_duder, [_rsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D"]; 
			[_duder] remoteExecCall ["goko_fnc_movelips"];
			
			waitUntil
			{
				sleep 1.5;
				true;
			};
			
			if (round (random 100) < goko_randomizeblu) then
			{	
				_bluforsels = _duder nearEntities [["B_Soldier_base_F"], 30] - [_duder]; 
				if (_bluforsels isequalto []) exitwith{};
				_bluforsele = selectRandom _bluforsels; 
			
				_bcoverus = ["bcover01", "bcover02", "bcover03", "bcover04", "bcover05", "bcover06", "bcover07", "bcover08", "bcover09", "bcover10", "bcover11", "bcover12", "bcover13", "bcover14", "bcover15", "bcover16", "bcover17"];
				_bcoveru = selectRandom _bcoverus;
				[_bluforsele, [_bcoveru, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
			};
		};

	} else
	{
		if (currentweapon _unit != secondaryweapon _unit) then
		{
			_lowsounds = ["blowammo01", "blowammo02", "blowammo03", "blowammo04", "blowammo05", "blowammo06"];
			_lowsound = selectRandom _lowsounds;
			[_unit, [_lowsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D"];
			[_unit] remoteExecCall ["goko_fnc_movelips"];
		} else
		{
			_bluforsels = _unit nearEntities [["B_Soldier_base_F"], 30] - [_unit]; 
			if (_bluforsels isequalto []) exitwith{};
			_bluforsele = selectRandom _bluforsels; 
			
			_bcoverusrpg = ["bcover01", "bcover02", "bcover03", "bcover04", "bcover10", "bcover11", "bcover12", "bcover13"];
			_bcoverurpg = selectRandom _bcoverusrpg;
			[_bluforsele, [_bcoverurpg, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
			[_bluforsele] remoteExecCall ["goko_fnc_movelips"];
		};
	};
};
