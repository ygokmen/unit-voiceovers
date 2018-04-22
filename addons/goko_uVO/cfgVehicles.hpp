class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class EventHandlers;
	};	
	class SoldierEB: CAManBase
	{
		class EventHandlers: EventHandlers
		{
			class goko_svo_opfor
			{
				init = "_this execVM '\goko_uVO\core\goko_opfor_init.sqf'";
			};
		};
	};	
	class SoldierWB: CAManBase
	{
		class EventHandlers: EventHandlers
		{
			class goko_svo_blufor
			{
				init = "_this execVM '\goko_uVO\core\goko_blufor_init.sqf'";
			};
		};	
	};
	class SoldierGB: CAManBase
	{
		class EventHandlers;
	};
	class I_G_Soldier_base_F: SoldierGB
	{
		class EventHandlers: EventHandlers
		{
			class goko_svo_insurgents
			{
				init = "_this execVM '\goko_uVO\core\goko_insurgents_init.sqf'";
			};
		};
	};
	class I_Soldier_base_F: SoldierGB
	{
		class EventHandlers: EventHandlers
		{
			class goko_svo_independent
			{
				init = "_this execVM '\goko_uVO\core\goko_inde_init.sqf'";
			};
		};
	};
};
