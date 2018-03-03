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
	class SoldierGR: CAManBase
	{
		class EventHandlers: EventHandlers
		{
			class goko_svo_independent
			{
				init = "_this execVM '\goko_uVO\core\goko_independent_init.sqf'";
			};
		};	
	};
	class SoldierGB: CAManBase
	{
		class EventHandlers: EventHandlers
		{
			class goko_svo_independent
			{
				init = "_this execVM '\goko_uVO\core\goko_independent_init.sqf'";
			};
		};	
	};
};
