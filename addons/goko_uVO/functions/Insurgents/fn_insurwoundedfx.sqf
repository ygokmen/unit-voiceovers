goko_randomizeINS = 67;

goko_fnc_INSdmgwoundsys = 
{
	params ["_victim", "_causedBy", "_damage", "_shooter"];
	
	if (goko_var_cltalking) exitWith {};
	_sidevictim = side _victim;
	_sideshooter = side _shooter;
	_isFriendly = [_sidevictim, _sideshooter] call BIS_fnc_sideIsFriendly;
	
	if (faction _shooter in ["IND_G_F"]) then 
	{
		_fsounds = ["inwatchfire01", "inwatchfire02", "inwatchfire03", "inwatchfire04", "inwatchfire05", "inwatchfire06", "inwatchfire07", "inwatchfire08","inwatchfire09", "inwatchfire10", "inwatchfire11"];
		_fsound = selectRandom _fsounds;
		[_victim, [_fsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		[_victim] remoteExecCall ["goko_fnc_movelips"];
	} else
	{
		_wsounds = ["inwounded01", "inwounded02", "inwounded03", "inwounded04", "inwounded05", "inwounded06", "inwounded07", "inwounded08", "inwounded09", "inwounded10", "inwounded11", "inwounded12", "inwounded13", "inwounded14", "inwounded15", "inwounded16", "inwounded17", "inwounded18", "inwounded19", "inwounded20", "inwounded21", "inwounded22", "inwounded23", "inwounded24", "inwounded25", "inwounded26", "inwounded27", "inwounded28", "inwounded29", "inwounded30", "inwounded31", "inwounded32", "inwounded33", "inwounded34", "inwounded35", "inwounded36", "inwounded37", "inwounded38", "inwounded39", "inwounded40", "inwounded41", "inwounded42", "inwounded43", "inwounded44", "inwounded45", "inwounded46", "inwounded47", "inwounded48", "inwounded49", "inwounded50", "inwounded51", "inwounded52", "inwounded53", "inwounded54", "inwounded55", "inwounded56", "inwounded57", "inwounded58", "inwounded59"];
		_wsound = selectRandom _wsounds;
		[_victim, [_wsound, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		[_victim] remoteExecCall ["goko_fnc_movelips"];
	};
};

goko_fnc_INSdeath =
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
	
	if (round (random 100) < goko_randomizeindi) then 
	{
		_abowin = _unit nearEntities [["I_G_Soldier_base_F"], 50]; 
		if (_abowin isequalto [] || _abowin isequalto [_unit]) exitwith{};
		_obarain = selectRandom _abowin; 
		
		_insubdowns = ["insubdown01", "insubdown02", "insubdown03", "insubdown04", "insubdown05", "insubdown06", "insubdown07", "insubdown08", "insubdown09", "insubdown10", "insubdown11", "insubdown12", "insubdown13", "insubdown14", "insubdown15", "insubdown16", "insubdown17", "insubdown18", "insubdown19", "insubdown20", "insubdown21", "insubdown22", "insubdown23", "insubdown24", "insubdown25", "insubdown26", "insubdown27"];
		_insubdown = selectRandom _insubdowns;
		[_obarain, [_insubdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
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
	
	if (side _killer == west) then 
	{
		_btargetdowns = ["btarget01", "btarget02", "btarget03", "btarget04", "btarget05", "btarget06", "btarget07", "btarget08", "btarget09", "btarget10"];
		_btargetdown = selectRandom _btargetdowns;
			
		_suppbtargetdowns = ["bsupptarget01", "bsupptarget02", "bsupptarget03", "bsupptarget04", "bsupptarget05", "bsupptarget06", "bsupptarget07", "bsupptarget08", "bsupptarget09", "bsupptarget10"];
		_suppbtargetdown = selectRandom _suppbtargetdowns;
			
		if (_meters > 100) then 
		{
			[_killer, [_btargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		} else 
		{
			[_killer, [_suppbtargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		};
	};
	
	if (faction _killer in ["IND_F"]) then
	{
		_insurtargetdowns = ["intarget01", "intarget02", "intarget03", "intarget04", "intarget05", "intarget06", "intarget07", "intarget08", "intarget09", "intarget10", "insupptarget01", "insupptarget02", "insupptarget03", "insupptarget04", "insupptarget05", "insupptarget06", "insupptarget07", "insupptarget08", "insupptarget09", "insupptarget10"];
		_insurargetdown = selectRandom _insurtargetdowns;
		[_killer, [_insurargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	};
};

goko_fnc_INSdeath_ace3 =
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
	
	if (round (random 100) < goko_randomizeindi) then 
	{
		_abowin = _unit nearEntities [["I_G_Soldier_base_F"], 50]; 
		if (_abowin isequalto [] || _abowin isequalto [_unit]) exitwith{};
		_obarain = selectRandom _abowin; 
		
		_insubdowns = ["insubdown01", "insubdown02", "insubdown03", "insubdown04", "insubdown05", "insubdown06", "insubdown07", "insubdown08", "insubdown09", "insubdown10", "insubdown11", "insubdown12", "insubdown13", "insubdown14", "insubdown15", "insubdown16", "insubdown17", "insubdown18", "insubdown19", "insubdown20", "insubdown21", "insubdown22", "insubdown23", "insubdown24", "insubdown25", "insubdown26", "insubdown27"];
		_insubdown = selectRandom _insubdowns;
		[_obarain, [_insubdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
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
	
	if (side _killer == west) then 
	{
		_btargetdowns = ["btarget01", "btarget02", "btarget03", "btarget04", "btarget05", "btarget06", "btarget07", "btarget08", "btarget09", "btarget10"];
		_btargetdown = selectRandom _btargetdowns;
			
		_suppbtargetdowns = ["bsupptarget01", "bsupptarget02", "bsupptarget03", "bsupptarget04", "bsupptarget05", "bsupptarget06", "bsupptarget07", "bsupptarget08", "bsupptarget09", "bsupptarget10"];
		_suppbtargetdown = selectRandom _suppbtargetdowns;
			
		if (_meters > 100) then 
		{
			[_killer, [_btargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		} else 
		{
			[_killer, [_suppbtargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
		};
	};
		
	if (faction _killer in ["IND_F"]) then
	{
		_insurtargetdowns = ["intarget01", "intarget02", "intarget03", "intarget04", "intarget05", "intarget06", "intarget07", "intarget08", "intarget09", "intarget10", "insupptarget01", "insupptarget02", "insupptarget03", "insupptarget04", "insupptarget05", "insupptarget06", "insupptarget07", "insupptarget08", "insupptarget09", "insupptarget10"];
		_insurargetdown = selectRandom _insurtargetdowns;
		[_killer, [_insurargetdown, goko_vo_soundsdiameter, goko_vo_soundsamplepitch]] remoteExec ["say3D", 0];
	};
};
