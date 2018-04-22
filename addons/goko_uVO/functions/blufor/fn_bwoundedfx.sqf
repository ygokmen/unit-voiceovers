goko_bmandownchance = 67;

goko_fnc_bdmgwoundsys = 
{
	params ["_victim", "_causedBy", "_damage", "_shooter"];

	if (_damage < 0.16) exitWith {};
	if (side _shooter == west) then
	{
		_fsounds = ["bwatchfire01", "bwatchfire02", "bwatchfire03", "bwatchfire04", "bwatchfire05", "bwatchfire06", "bwatchfire07", "bwatchfire08","bwatchfire09", "bwatchfire10", "bwatchfire11", "bwatchfire12", "bwatchfire13", "bwatchfire14", "bwatchfire15"];
		_fsound = selectRandom _fsounds;
		[_victim, [_fsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	};
	
	private _wsounds = ["bwounded01", "bwounded02", "bwounded03", "bwounded04", "bwounded05", "bwounded06", "bwounded07", "bwounded08", "bwounded09", "bwounded10", "bwounded11", "bwounded12", "bwounded13", "bwounded14", "bwounded15", "bwounded16", "bwounded17", "bwounded18", "bwounded19", "bwounded20", "bwounded21", "bwounded22", "bwounded23", "bwounded24", "bwounded25", "bwounded26", "bwounded27", "bwounded28", "bwounded29", "bwounded30", "bwounded31", "bwounded32", "bwounded33", "bwounded34", "bwounded35", "bwounded36", "bwounded37", "bwounded38", "bwounded39", "bwounded40", "bwounded41", "bwounded42", "bwounded43", "bwounded44", "bwounded45", "bwounded46", "bwounded47", "bwounded48", "bwounded49", "bwounded50", "bwounded51", "bwounded52"];
	_wsound = selectRandom _wsounds;
	[_victim, [_wsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
};

goko_fnc_bdeath =
{
	params ["_unit", "_shooter", "_killer"];

	private _meters = round (_unit distance _killer);
	private _deathsArray = 
	[
		"goko_uVO\sounds\pl_deathshout_01.wav",
		"goko_uVO\sounds\pl_deathshout_02.wav",
		"goko_uVO\sounds\pl_deathshout_03.wav",
		"goko_uVO\sounds\pl_deathshout_04.wav",
		"goko_uVO\sounds\pl_deathshout_05.wav",
		"goko_uVO\sounds\pl_deathshout_06.wav",
		"goko_uVO\sounds\pl_deathshout_07.wav",
		"goko_uVO\sounds\pl_deathshout_08.wav",
		"goko_uVO\sounds\pl_deathshout_09.wav",
		"goko_uVO\sounds\pl_deathshout_10.wav",
		"goko_uVO\sounds\pl_deathshout_11.wav",
		"goko_uVO\sounds\pl_deathshout_12.wav",
		"goko_uVO\sounds\pl_deathshout_13.wav",
		"goko_uVO\sounds\pl_deathshout_14.wav",
		"goko_uVO\sounds\pl_deathshout_15.wav",
		"goko_uVO\sounds\pl_deathshout_16.wav",
		"goko_uVO\sounds\pl_deathshout_17.wav",
		"goko_uVO\sounds\pl_deathshout_18.wav",
		"goko_uVO\sounds\pl_deathshout_19.wav",
		"goko_uVO\sounds\pl_deathshout_20.wav",
		"goko_uVO\sounds\pl_deathshout_21.wav",
		"goko_uVO\sounds\pl_deathshout_22.wav",
		"goko_uVO\sounds\pl_deathshout_23.wav",
		"goko_uVO\sounds\pl_deathshout_24.wav",
		"goko_uVO\sounds\pl_deathshout_25.wav",
		"goko_uVO\sounds\pl_deathshout_26.wav",
		"goko_uVO\sounds\pl_deathshout_27.wav",
		"goko_uVO\sounds\pl_deathshout_28.wav",
		"goko_uVO\sounds\pl_deathshout_29.wav",
		"goko_uVO\sounds\pl_deathshout_30.wav",
		"goko_uVO\sounds\pl_deathshout_31.wav",
		"goko_uVO\sounds\pl_deathshout_32.wav",
		"goko_uVO\sounds\pl_deathshout_33.wav",
		"goko_uVO\sounds\pl_deathshout_34.wav",
		"goko_uVO\sounds\pl_deathshout_35.wav",
		"goko_uVO\sounds\pl_deathshout_36.wav",
		"goko_uVO\sounds\pl_deathshout_37.wav",
		"goko_uVO\sounds\pl_deathshout_38.wav",
		"goko_uVO\sounds\pl_deathshout_39.wav",
		"goko_uVO\sounds\pl_deathshout_40.wav",
		"goko_uVO\sounds\pl_deathshout_41.wav",
		"goko_uVO\sounds\pl_deathshout_42.wav",
		"goko_uVO\sounds\pl_deathshout_43.wav",
		"goko_uVO\sounds\pl_deathshout_44.wav",
		"goko_uVO\sounds\pl_deathshout_45.wav",
		"goko_uVO\sounds\pl_deathshout_46.wav",
		"goko_uVO\sounds\pl_deathshout_47.wav",
		"goko_uVO\sounds\pl_deathshout_48.wav",
		"goko_uVO\sounds\pl_deathshout_49.wav"
	];
	
	_deathsound = selectRandom _deathsArray;
	playsound3d [format ["%1",_deathsound], _unit, false, getPosASL _unit, goko_vo_deathshouts_volume, 1, goko_vo_deathshouts_diameter];
	
	if (round (random 100) < goko_bmandownchance) then 
	{
		private _abowb = nearestObjects [_unit, ["B_Soldier_base_F"], 50] - [_unit]; 
		_obarab = selectRandom _abowb; 
		
		private _bsubdowns = ["bsubdown01", "bsubdown02", "bsubdown03", "bsubdown04", "bsubdown05", "bsubdown06", "bsubdown07", "bsubdown08", "bsubdown09", "bsubdown10", "bsubdown11", "bsubdown12", "bsubdown13", "bsubdown14", "bsubdown15", "bsubdown16", "bsubdown17", "bsubdown18", "bsubdown19", "bsubdown20", "bsubdown21", "bsubdown22", "bsubdown23", "bsubdown24", "bsubdown25", "bsubdown26", "bsubdown27", "bsubdown28", "bsubdown29", "bsubdown30", "bsubdown31", "bsubdown32", "bsubdown33", "bsubdown34", "bsubdown35", "bsubdown36", "bsubdown37", "bsubdown38", "bsubdown39", "bsubdown40", "bsubdown41", "bsubdown42", "bsubdown43", "bsubdown44", "bsubdown45", "bsubdown46", "bsubdown47", "bsubdown48", "bsubdown49", "bsubdown50", "bsubdown51", "bsubdown52", "bsubdown53", "bsubdown54", "bsubdown55", "bsubdown56", "bsubdown57", "bsubdown58", "bsubdown59", "bsubdown60", "bsubdown61", "bsubdown62", "bsubdown63", "bsubdown64", "bsubdown65", "bsubdown66", "bsubdown67"];
		_bsubdown = selectRandom _bsubdowns;
		[_obarab, [_bsubdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	};
	if (round (random 100) > goko_vo_killconfirmratio) exitWith {};
	
	if (side _killer == east) then 
	{
		private _otargetdowns = ["otarget01", "otarget02", "otarget03", "otarget04", "otarget05", "otarget06", "otarget07", "otarget08", "otarget09", "otarget10"];
		_otargetdown = selectRandom _otargetdowns;
			
		private _suppotargetdowns = ["osupptarget01", "osupptarget02", "osupptarget03", "osupptarget04", "osupptarget05", "osupptarget06", "osupptarget07", "osupptarget08", "osupptarget09", "osupptarget10"];
		_suppotargetdown = selectRandom _suppotargetdowns;
			
		if (_meters > 100) then 
		{
			[_killer, [_otargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		} else 
		{
			[_killer, [_suppotargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		};
	};
	
	if (side _killer == independent) then 
	{
		private _intargetdowns = ["intarget01", "intarget02", "intarget03", "intarget04", "intarget05", "intarget06", "intarget07", "intarget08", "intarget09", "intarget10"];
		_intargetdown = selectRandom _intargetdowns;
			
		private _suppintargetdowns = ["insupptarget01", "insupptarget02", "insupptarget03", "insupptarget04", "insupptarget05", "insupptarget06", "insupptarget07", "insupptarget08", "insupptarget09", "insupptarget10"];
		_suppintargetdown = selectRandom _suppintargetdowns;
			
		if (_meters > 100) then 
		{
			[_killer, [_intargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		} else 
		{
			[_killer, [_suppintargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		};
	};
};

goko_fnc_bdeath_ace3 =
{
	params ["_unit"];
	
	_killer = _unit getVariable "ace_medical_lastDamageSource";

	private _meters = round (_unit distance _killer);
	private _deathsArray = 
	[
		"goko_uVO\sounds\pl_deathshout_01.wav",
		"goko_uVO\sounds\pl_deathshout_02.wav",
		"goko_uVO\sounds\pl_deathshout_03.wav",
		"goko_uVO\sounds\pl_deathshout_04.wav",
		"goko_uVO\sounds\pl_deathshout_05.wav",
		"goko_uVO\sounds\pl_deathshout_06.wav",
		"goko_uVO\sounds\pl_deathshout_07.wav",
		"goko_uVO\sounds\pl_deathshout_08.wav",
		"goko_uVO\sounds\pl_deathshout_09.wav",
		"goko_uVO\sounds\pl_deathshout_10.wav",
		"goko_uVO\sounds\pl_deathshout_11.wav",
		"goko_uVO\sounds\pl_deathshout_12.wav",
		"goko_uVO\sounds\pl_deathshout_13.wav",
		"goko_uVO\sounds\pl_deathshout_14.wav",
		"goko_uVO\sounds\pl_deathshout_15.wav",
		"goko_uVO\sounds\pl_deathshout_16.wav",
		"goko_uVO\sounds\pl_deathshout_17.wav",
		"goko_uVO\sounds\pl_deathshout_18.wav",
		"goko_uVO\sounds\pl_deathshout_19.wav",
		"goko_uVO\sounds\pl_deathshout_20.wav",
		"goko_uVO\sounds\pl_deathshout_21.wav",
		"goko_uVO\sounds\pl_deathshout_22.wav",
		"goko_uVO\sounds\pl_deathshout_23.wav",
		"goko_uVO\sounds\pl_deathshout_24.wav",
		"goko_uVO\sounds\pl_deathshout_25.wav",
		"goko_uVO\sounds\pl_deathshout_26.wav",
		"goko_uVO\sounds\pl_deathshout_27.wav",
		"goko_uVO\sounds\pl_deathshout_28.wav",
		"goko_uVO\sounds\pl_deathshout_29.wav",
		"goko_uVO\sounds\pl_deathshout_30.wav",
		"goko_uVO\sounds\pl_deathshout_31.wav",
		"goko_uVO\sounds\pl_deathshout_32.wav",
		"goko_uVO\sounds\pl_deathshout_33.wav",
		"goko_uVO\sounds\pl_deathshout_34.wav",
		"goko_uVO\sounds\pl_deathshout_35.wav",
		"goko_uVO\sounds\pl_deathshout_36.wav",
		"goko_uVO\sounds\pl_deathshout_37.wav",
		"goko_uVO\sounds\pl_deathshout_38.wav",
		"goko_uVO\sounds\pl_deathshout_39.wav",
		"goko_uVO\sounds\pl_deathshout_40.wav",
		"goko_uVO\sounds\pl_deathshout_41.wav",
		"goko_uVO\sounds\pl_deathshout_42.wav",
		"goko_uVO\sounds\pl_deathshout_43.wav",
		"goko_uVO\sounds\pl_deathshout_44.wav",
		"goko_uVO\sounds\pl_deathshout_45.wav",
		"goko_uVO\sounds\pl_deathshout_46.wav",
		"goko_uVO\sounds\pl_deathshout_47.wav",
		"goko_uVO\sounds\pl_deathshout_48.wav",
		"goko_uVO\sounds\pl_deathshout_49.wav"
	];
	
	_deathsound = selectRandom _deathsArray;
	playsound3d [format ["%1",_deathsound], _unit, false, getPosASL _unit, goko_vo_deathshouts_volume, 1, goko_vo_deathshouts_diameter];
	
	if (round (random 100) < goko_bmandownchance) then 
	{
		private _abowb = nearestObjects [_unit, ["B_Soldier_base_F"], 50] - [_unit]; 
		_obarab = selectRandom _abowb; 
		
		private _bsubdowns = ["bsubdown01", "bsubdown02", "bsubdown03", "bsubdown04", "bsubdown05", "bsubdown06", "bsubdown07", "bsubdown08", "bsubdown09", "bsubdown10", "bsubdown11", "bsubdown12", "bsubdown13", "bsubdown14", "bsubdown15", "bsubdown16", "bsubdown17", "bsubdown18", "bsubdown19", "bsubdown20", "bsubdown21", "bsubdown22", "bsubdown23", "bsubdown24", "bsubdown25", "bsubdown26", "bsubdown27", "bsubdown28", "bsubdown29", "bsubdown30", "bsubdown31", "bsubdown32", "bsubdown33", "bsubdown34", "bsubdown35", "bsubdown36", "bsubdown37", "bsubdown38", "bsubdown39", "bsubdown40", "bsubdown41", "bsubdown42", "bsubdown43", "bsubdown44", "bsubdown45", "bsubdown46", "bsubdown47", "bsubdown48", "bsubdown49", "bsubdown50", "bsubdown51", "bsubdown52", "bsubdown53", "bsubdown54", "bsubdown55", "bsubdown56", "bsubdown57", "bsubdown58", "bsubdown59", "bsubdown60", "bsubdown61", "bsubdown62", "bsubdown63", "bsubdown64", "bsubdown65", "bsubdown66", "bsubdown67"];
		_bsubdown = selectRandom _bsubdowns;
		[_obarab, [_bsubdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	};
	if (round (random 100) > goko_vo_killconfirmratio) exitWith {};
	
	if (side _killer == east) then 
	{
		private _otargetdowns = ["otarget01", "otarget02", "otarget03", "otarget04", "otarget05", "otarget06", "otarget07", "otarget08", "otarget09", "otarget10"];
		_otargetdown = selectRandom _otargetdowns;
			
		private _suppotargetdowns = ["osupptarget01", "osupptarget02", "osupptarget03", "osupptarget04", "osupptarget05", "osupptarget06", "osupptarget07", "osupptarget08", "osupptarget09", "osupptarget10"];
		_suppotargetdown = selectRandom _suppotargetdowns;
			
		if (_meters > 100) then 
		{
			[_killer, [_otargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		} else 
		{
			[_killer, [_suppotargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		};
	};
	
	if (side _killer == independent) then 
	{
		private _intargetdowns = ["intarget01", "intarget02", "intarget03", "intarget04", "intarget05", "intarget06", "intarget07", "intarget08", "intarget09", "intarget10"];
		_intargetdown = selectRandom _intargetdowns;
			
		private _suppintargetdowns = ["insupptarget01", "insupptarget02", "insupptarget03", "insupptarget04", "insupptarget05", "insupptarget06", "insupptarget07", "insupptarget08", "insupptarget09", "insupptarget10"];
		_suppintargetdown = selectRandom _suppintargetdowns;
			
		if (_meters > 100) then 
		{
			[_killer, [_intargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		} else 
		{
			[_killer, [_suppintargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		};
	};
};
