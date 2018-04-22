goko_randomizeblu = 67;

goko_fnc_bdmgwoundsys = 
{
	params ["_victim", "_causedBy", "_damage", "_shooter"];

	if (goko_var_cltalking) exitWith {};
	
	if (side _shooter == west) then
	{
		_fsounds = ["bwatchfire01", "bwatchfire02", "bwatchfire03", "bwatchfire04", "bwatchfire05", "bwatchfire06", "bwatchfire07", "bwatchfire08","bwatchfire09", "bwatchfire10", "bwatchfire11", "bwatchfire12", "bwatchfire13", "bwatchfire14", "bwatchfire15"];
		_fsound = selectRandom _fsounds;
		[_victim, [_fsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		[_victim] remoteExecCall ["goko_fnc_movelips"];
	} else
	{
		_wsounds = ["bwounded01", "bwounded02", "bwounded03", "bwounded04", "bwounded05", "bwounded06", "bwounded07", "bwounded08", "bwounded09", "bwounded10", "bwounded11", "bwounded12", "bwounded13", "bwounded14", "bwounded15", "bwounded16", "bwounded17", "bwounded18", "bwounded19", "bwounded20", "bwounded21", "bwounded22", "bwounded23", "bwounded24", "bwounded25", "bwounded26", "bwounded27", "bwounded28", "bwounded29", "bwounded30", "bwounded31", "bwounded32", "bwounded33", "bwounded34", "bwounded35", "bwounded36", "bwounded37", "bwounded38", "bwounded39", "bwounded40", "bwounded41", "bwounded42", "bwounded43", "bwounded44", "bwounded45", "bwounded46", "bwounded47", "bwounded48", "bwounded49", "bwounded50", "bwounded51", "bwounded52"];
		_wsound = selectRandom _wsounds;
		[_victim, [_wsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		[_victim] remoteExecCall ["goko_fnc_movelips"];
	};
};

goko_fnc_bdeath =
{
	params ["_unit", "_shooter", "_killer"];

	_meters = round (_unit distance _killer);
	_deathsArray = 
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
	
	if (round (random 100) < goko_randomizeblu) then 
	{
		_abowb = _unit nearEntities [["B_Soldier_base_F"], 50]; 
		if (_abowb isequalto [] || _abowb isequalto [_unit]) exitwith{};
		_obarab = selectRandom _abowb; 
		
		_bsubdowns = ["bsubdown01", "bsubdown02", "bsubdown03", "bsubdown04", "bsubdown05", "bsubdown06", "bsubdown07", "bsubdown08", "bsubdown09", "bsubdown10", "bsubdown11", "bsubdown12", "bsubdown13", "bsubdown14", "bsubdown15", "bsubdown16", "bsubdown17", "bsubdown18", "bsubdown19", "bsubdown20", "bsubdown21", "bsubdown22", "bsubdown23", "bsubdown24", "bsubdown25", "bsubdown26", "bsubdown27", "bsubdown28", "bsubdown29", "bsubdown30", "bsubdown31", "bsubdown32", "bsubdown33", "bsubdown34", "bsubdown35", "bsubdown36", "bsubdown37", "bsubdown38", "bsubdown39", "bsubdown40", "bsubdown41", "bsubdown42", "bsubdown43", "bsubdown44", "bsubdown45", "bsubdown46", "bsubdown47", "bsubdown48", "bsubdown49", "bsubdown50", "bsubdown51", "bsubdown52", "bsubdown53", "bsubdown54", "bsubdown55", "bsubdown56", "bsubdown57", "bsubdown58", "bsubdown59", "bsubdown60", "bsubdown61", "bsubdown62", "bsubdown63", "bsubdown64", "bsubdown65", "bsubdown66", "bsubdown67"];
		_bsubdown = selectRandom _bsubdowns;
		[_obarab, [_bsubdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	};
	if (round (random 100) > goko_vo_killconfirmratio) exitWith {};
	
	if (side _killer == east) then 
	{
		_otargetdowns = ["otarget01", "otarget02", "otarget03", "otarget04", "otarget05", "otarget06", "otarget07", "otarget08", "otarget09", "otarget10"];
		_otargetdown = selectRandom _otargetdowns;
			
		_suppotargetdowns = ["osupptarget01", "osupptarget02", "osupptarget03", "osupptarget04", "osupptarget05", "osupptarget06", "osupptarget07", "osupptarget08", "osupptarget09", "osupptarget10"];
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
		_intargetdowns = ["intarget01", "intarget02", "intarget03", "intarget04", "intarget05", "intarget06", "intarget07", "intarget08", "intarget09", "intarget10"];
		_intargetdown = selectRandom _intargetdowns;
			
		_suppintargetdowns = ["insupptarget01", "insupptarget02", "insupptarget03", "insupptarget04", "insupptarget05", "insupptarget06", "insupptarget07", "insupptarget08", "insupptarget09", "insupptarget10"];
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

	_meters = round (_unit distance _killer);
	_deathsArray = 
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
	
	if (round (random 100) < goko_randomizeblu) then 
	{
		_abowb = _unit nearEntities [["B_Soldier_base_F"], 50]; 
		if (_abowb isequalto [] || _abowb isequalto [_unit]) exitwith{};
		_obarab = selectRandom _abowb;
		
		_bsubdowns = ["bsubdown01", "bsubdown02", "bsubdown03", "bsubdown04", "bsubdown05", "bsubdown06", "bsubdown07", "bsubdown08", "bsubdown09", "bsubdown10", "bsubdown11", "bsubdown12", "bsubdown13", "bsubdown14", "bsubdown15", "bsubdown16", "bsubdown17", "bsubdown18", "bsubdown19", "bsubdown20", "bsubdown21", "bsubdown22", "bsubdown23", "bsubdown24", "bsubdown25", "bsubdown26", "bsubdown27", "bsubdown28", "bsubdown29", "bsubdown30", "bsubdown31", "bsubdown32", "bsubdown33", "bsubdown34", "bsubdown35", "bsubdown36", "bsubdown37", "bsubdown38", "bsubdown39", "bsubdown40", "bsubdown41", "bsubdown42", "bsubdown43", "bsubdown44", "bsubdown45", "bsubdown46", "bsubdown47", "bsubdown48", "bsubdown49", "bsubdown50", "bsubdown51", "bsubdown52", "bsubdown53", "bsubdown54", "bsubdown55", "bsubdown56", "bsubdown57", "bsubdown58", "bsubdown59", "bsubdown60", "bsubdown61", "bsubdown62", "bsubdown63", "bsubdown64", "bsubdown65", "bsubdown66", "bsubdown67"];
		_bsubdown = selectRandom _bsubdowns;
		[_obarab, [_bsubdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	};
	if (round (random 100) > goko_vo_killconfirmratio) exitWith {};
	
	if (side _killer == east) then 
	{
		_otargetdowns = ["otarget01", "otarget02", "otarget03", "otarget04", "otarget05", "otarget06", "otarget07", "otarget08", "otarget09", "otarget10"];
		_otargetdown = selectRandom _otargetdowns;
			
		_suppotargetdowns = ["osupptarget01", "osupptarget02", "osupptarget03", "osupptarget04", "osupptarget05", "osupptarget06", "osupptarget07", "osupptarget08", "osupptarget09", "osupptarget10"];
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
		_intargetdowns = ["intarget01", "intarget02", "intarget03", "intarget04", "intarget05", "intarget06", "intarget07", "intarget08", "intarget09", "intarget10"];
		_intargetdown = selectRandom _intargetdowns;
			
		_suppintargetdowns = ["insupptarget01", "insupptarget02", "insupptarget03", "insupptarget04", "insupptarget05", "insupptarget06", "insupptarget07", "insupptarget08", "insupptarget09", "insupptarget10"];
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

goko_fnc_bCallDir =   
{ 
	params ["_unit"]; 
	_cTar = cursortarget;
	_knowabouts = _unit knowsabout _cTar; 
	if (_unit == player && _knowabouts > 0 && _cTar iskindof "MAN" && alive _cTar) then 
	{ 
 
		if (side _unit != side _cTar) then 
		{ 
			_azimuth = getDir _unit; 
			_direction = lolo; 
			switch (true) do 
			{ 
				case (_azimuth >= 337.5 ) : {_direction = "N" }; 
				case (_azimuth >= 22.5 and _azimuth < 67.5) : {_direction = "NE" }; 
				case (_azimuth >= 67.5 and _azimuth < 112.5) : {_direction = "E"; }; 
				case (_azimuth >= 112.5 and _azimuth < 157.5) : {_direction = "SE" }; 
				case (_azimuth >= 157.5 and _azimuth < 202.5) : {_direction = "S" }; 
				case (_azimuth >= 202.5 and _azimuth < 247.5) : {_direction = "SW" }; 
				case (_azimuth >= 247.5 and _azimuth < 292.5) : {_direction = "W" }; 
				case (_azimuth >= 292.5 and _azimuth < 337.5) : {_direction = "NW" }; 
			}; 

			if (_direction == "N") then 
			{ 
				_dirsounds = ["Benemynorth01", "Benemynorth02", "Benemynorth03", "Benemynorth04", "Benemynorth05", "Benemynorth06"]; 
				_dirsound = selectRandom _dirsounds; 
				[_unit, [_dirsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0]; 
				[_unit] remoteExecCall ["goko_fnc_movelips"]; 
			}; 

			if (_direction == "NE") then 
			{ 
				_dirsounds = ["BenemyNE01", "BenemyNE02", "BenemyNE03", "BenemyNE04", "BenemyNE05", "BenemyNE06"]; 
				_dirsound = selectRandom _dirsounds; 
				[_unit, [_dirsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0]; 
				[_unit] remoteExecCall ["goko_fnc_movelips"]; 
			}; 

			if (_direction == "E") then 
			{ 
				_dirsounds = ["Benemyeast01", "Benemyeast02", "Benemyeast03", "Benemyeast04", "Benemyeast05", "Benemyeast06"]; 
				_dirsound = selectRandom _dirsounds; 
				[_unit, [_dirsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0]; 
				[_unit] remoteExecCall ["goko_fnc_movelips"]; 
			}; 

			if (_direction == "SE") then 
			{ 
				_dirsounds = ["BenemySE01", "BenemySE02", "BenemySE03", "BenemySE04", "BenemySE05", "BenemySE06"]; 
				_dirsound = selectRandom _dirsounds; 
				[_unit, [_dirsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0]; 
				[_unit] remoteExecCall ["goko_fnc_movelips"]; 
			}; 

			if (_direction == "S") then 
			{ 
				_dirsounds = ["Benemysouth01", "Benemysouth02", "Benemysouth03", "Benemysouth04", "Benemysouth05", "Benemysouth06"]; 
				_dirsound = selectRandom _dirsounds; 
				[_unit, [_dirsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0]; 
				[_unit] remoteExecCall ["goko_fnc_movelips"]; 

			}; 

			if (_direction == "SW") then 
			{ 
				_dirsounds = ["BenemySW01", "BenemySW02", "BenemySW03", "BenemySW04", "BenemySW05", "BenemySW06"]; 
				_dirsound = selectRandom _dirsounds; 
				[_unit, [_dirsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0]; 
				[_unit] remoteExecCall ["goko_fnc_movelips"]; 
			}; 

			if (_direction == "W") then 
			{ 
				_dirsounds = ["Benemywest01", "Benemywest02", "Benemywest03", "Benemywest04", "Benemywest05", "Benemywest06"]; 
				_dirsound = selectRandom _dirsounds; 
				[_unit, [_dirsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0]; 
				[_unit] remoteExecCall ["goko_fnc_movelips"]; 
			}; 

			if (_direction == "NW") then 
			{ 
				_dirsounds = ["BenemyNW01", "BenemyNW02", "BenemyNW03", "BenemyNW04", "BenemyNW05", "BenemyNW06"]; 
				_dirsound = selectRandom _dirsounds; 
				[_unit, [_dirsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0]; 
				[_unit] remoteExecCall ["goko_fnc_movelips"]; 
			}; 
		}; 
	}; 
}; 
