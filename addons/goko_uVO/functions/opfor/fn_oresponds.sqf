goko_fnc_o_acem84 = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	
	if !(_magazine in ["ACE_M84"]) exitWith {};
	_Oaceflashsounds = 
	[
		"oflash01", 
		"oflash02", 
		"oflash03", 
		"oflash04", 
		"oflash05", 
		"oflash06", 
		"oflash07"
	];
	_Oaceflashsound = selectRandom _Oaceflashsounds;
	[_shooter, [_Oaceflashsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	[_shooter] remoteExecCall ["goko_fnc_movelips"];
};

goko_fnc_o_aceM14 = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	if !(_magazine in ["ACE_M14"]) exitWith {};
	_Oaceincendierysounds = 
	[
		"oIncgren01", 
		"oIncgren02", 
		"oIncgren03", 
		"oIncgren04", 
		"oIncgren05", 
		"oIncgren06", 
		"oIncgren07"
	];
	_Oaceincendierysound = selectRandom _Oaceincendierysounds;
	[_shooter, [_Oaceincendierysound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	[_shooter] remoteExecCall ["goko_fnc_movelips"];
};

goko_fnc_oexplosvfx = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	if !(_magazine in ["SatchelCharge_Remote_Mag", "DemoCharge_Remote_Mag", "ATMine_Range_Mag", "APERSMine_Range_Mag", "APERSBoundingMine_Range_Mag", "SLAMDirectionalMine_Wire_Mag", "APERSTripMine_Wire_Mag", "ClaymoreDirectionalMine_Remote_Mag", "IEDUrbanBig_Remote_Mag", "IEDLandBig_Remote_Mag", "IEDUrbanSmall_Remote_Mag", "IEDLandSmall_Remote_Mag"]) exitWith {};
	_sounds = 
	[
		"oexpls01", 
		"oexpls02", 
		"oexpls03", 
		"oexpls04", 
		"oexpls05", 
		"oexpls06", 
		"oexpls07", 
		"oexpls08", 
		"oexpls09", 
		"oexpls10", 
		"oexpls11", 
		"oexpls12", 
		"oexpls13", 
		"oexpls14", 
		"oexpls15", 
		"oexpls16", 
		"oexpls17"
	];
	_sound = selectRandom _sounds;
	[_shooter, [_sound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D"];
	[_shooter] remoteExecCall ["goko_fnc_movelips"];
};

goko_fnc_ofragfx = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	if !(_magazine in ["HandGrenade", "MiniGrenade"]) exitWith {};
	_sounds = 
	[
		"ofrag01",
		"ofrag02",
		"ofrag03",
		"ofrag04",
		"ofrag05",
		"ofrag06",
		"ofrag07",
		"ofrag08",
		"ofrag09",
		"ofrag10",
		"ofrag11",
		"ofrag12",
		"ofrag13",
		"ofrag14"
	];
	_sound = selectRandom _sounds;
	[_shooter, [_sound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D"];
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
		
		_findnearby = _frag nearEntities [["I_Soldier_base_F", "B_Soldier_base_F"], 16];
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
			
			if (side _nearby == west) then 
			{
				_bspottedfrag = ["Bspotnade01", "Bspotnade02", "Bspotnade03", "Bspotnade04", "Bspotnade05", "Bspotnade06", "Bspotnade07", "Bspotnade08", "Bspotnade09", "Bspotnade10", "Bspotnade11", "Bspotnade12", "Bspotnade13", "Bspotnade14", "Bspotnade15", "Bspotnade16", "Bspotnade17", "Bspotnade18", "Bspotnade19", "Bspotnade20"];
				_bfrag = selectRandom _bspottedfrag;

				[_nearby, [_bfrag, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
			};
		};
	};
};

goko_fnc_osmokefx = 
{
	params ["_shooter","_weapon", "_muzzle", "_mode", "_ammo", "_magazine"];
	
	if (hasinterface && !goko_vo_playeronoffswitch || goko_var_cltalking) exitWith {};
	if !(_magazine in ["SmokeShellOrange", "SmokeShellBlue", "SmokeShellPurple", "SmokeShellYellow", "SmokeShellGreen", "SmokeShellRed", "SmokeShell"]) exitWith {};
	_sounds = 
	[
		"osmoke01",
		"osmoke02",
		"osmoke03",
		"osmoke04",
		"osmoke05",
		"osmoke06",
		"osmoke07",
		"osmoke08",
		"osmoke09"
	];
	_sound = selectRandom _sounds;
	[_shooter, [_sound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D"];
	[_shooter] remoteExecCall ["goko_fnc_movelips"];
};

goko_fnc_oreloadedfx = 
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
			
			if (round (random 100) < goko_randomizeopfor) then
			{
				_opforsels = _duder nearEntities [["O_Soldier_base_F"], 30] - [_duder]; 
				if (_opforsels isEqualTo []) exitWith {};
				_opforsel = selectrandom _opforsels;
				
				_opcoverus = ["opcover01", "opcover02", "opcover03", "opcover04", "opcover05", "opcover06", "opcover07", "opcover08", "opcover09", "opcover10", "opcover11", "opcover12", "opcover13", "opcover14", "opcover15", "opcover16", "opcover17", "opcover18"];
				_opcoveru = selectrandom _opcoverus;
				[_opforsel, [_opcoveru, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
			};
		};
		
	} else
	{
		if (currentweapon _unit != secondaryweapon _unit) then
		{
			_lowsounds = ["olowammo01", "olowammo02", "olowammo03", "olowammo04", "olowammo05"];
			_lowsound = selectRandom _lowsounds;
			[_unit, [_lowsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D"];
			[_unit] remoteExecCall ["goko_fnc_movelips"];
		} else
		{
			_opforsels = _unit nearEntities [["O_Soldier_base_F"], 30] - [_unit];
			if (_opforsels isEqualTo []) exitWith {};
			_opforsel = selectrandom _opforsels;
			
			_opcoverusrpg = ["opcover01", "opcover02", "opcover03", "opcover14", "opcover15", "opcover16", "opcover17", "opcover18"];
			_opcoverurpg = selectRandom _opcoverusrpg;
			[_opforsel, [_opcoverurpg, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
			[_opforsel] remoteExecCall ["goko_fnc_movelips"];
		};
	};
};
