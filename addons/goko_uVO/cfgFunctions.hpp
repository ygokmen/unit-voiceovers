class CfgFunctions
{
	class gokoVO
	{
		class opfor
		{
			class calloutOpfor
			{
				file = "goko_uVO\functions\opfor\fn_calloutEnemy.sqf";
			};
			class opforConfirmKill
			{
				file = "goko_uVO\functions\opfor\fn_ebKillConfirm.sqf";
			};
			class killedOpfor
			{
				file = "goko_uVO\functions\opfor\fn_killed.sqf";
			};
			class killedOpforACE3
			{
				file = "goko_uVO\functions\opfor\fn_killed_ACE3.sqf";
			};
			class reloadingOpfor
			{
				file = "goko_uVO\functions\opfor\fn_reload.sqf";
			};
			class ammoLowOpfor
			{
				file = "goko_uVO\functions\opfor\fn_reload_sub.sqf";
			};
			class throwEventsOpfor
			{
				file = "goko_uVO\functions\opfor\fn_throwables.sqf";
				preInit = 1
			};
			class woundedOpfor
			{
				file = "goko_uVO\functions\opfor\fn_wounded.sqf";
			};
		};
		class blufor
		{
			class calloutBlufor
			{
				file = "goko_uVO\functions\blufor\fn_calloutEnemy.sqf";
			};
			class bluforConfirmKill
			{
				file = "goko_uVO\functions\blufor\fn_wbKillConfirm.sqf";
			};
			class killedBlufor
			{
				file = "goko_uVO\functions\blufor\fn_killed.sqf";
			};
			class killedBluforACE3
			{
				file = "goko_uVO\functions\blufor\fn_killed_ACE3.sqf";
			};
			class reloadingBlufor
			{
				file = "goko_uVO\functions\blufor\fn_reload.sqf";
			};
			class ammoLowBlufor
			{
				file = "goko_uVO\functions\blufor\fn_reload_sub.sqf";
			};
			class throwEventsBlufor
			{
				file = "goko_uVO\functions\blufor\fn_throwables.sqf";
				preInit = 1
			};
			class woundedBlufor
			{
				file = "goko_uVO\functions\blufor\fn_wounded.sqf";
			};
		};
		class Inde
		{
			class calloutInde
			{
				file = "goko_uVO\functions\Inde\fn_calloutEnemy.sqf";
			};
			class IndependentConfirmKill
			{
				file = "goko_uVO\functions\Inde\fn_gbKillConfirm.sqf";
			};
			class killedInde
			{
				file = "goko_uVO\functions\Inde\fn_killed.sqf";
			};
			class killedIndeACE3
			{
				file = "goko_uVO\functions\Inde\fn_killed_ACE3.sqf";
			};
			class reloadingInde
			{
				file = "goko_uVO\functions\Inde\fn_reload.sqf";
			};
			class ammoLowInde
			{
				file = "goko_uVO\functions\Inde\fn_reload_sub.sqf";
			};
			class throwEventsInde
			{
				file = "goko_uVO\functions\Inde\fn_throwables.sqf";
				preInit = 1
			};
			class woundedInde
			{
				file = "goko_uVO\functions\Inde\fn_wounded.sqf";
			};
		};
		class optionalCBA
		{
			class uvoCBAsettings
			{
				file = "goko_uVO\functions\fn_gokovo_settings.sqf";
				preInit = 1
			};
		};
		class unoPostinit
		{
			class uvoKeybinds
			{
				file = "goko_uVO\functions\fn_callouts_postinit.sqf";
				postInit = 1
			};
		};
		class emitSound
		{
			class globalsay3d
			{
				file = "goko_uVO\functions\fn_globalSay3d.sqf";
			};
		};
	};
};