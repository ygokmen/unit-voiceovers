/*
	goko unit voice-overs addon class definitions
	author: gökmen
	website: https://github.com/the0utsider
	description: initialise addon functions for types
*/

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
			class gokovo_opfor
			{
				init = "_this execVM '\goko_uVO\initialise\opfor_class_init.sqf'";
			};
		};
	};	
	class SoldierWB: CAManBase
	{
		class EventHandlers: EventHandlers
		{
			class gokovo_blufor
			{
				init = "_this execVM '\goko_uVO\initialise\blufor_class_init.sqf'";
			};
		};	
	};
	class SoldierGB: CAManBase
	{
		class EventHandlers: EventHandlers
		{
			class gokovo_independent
			{
				init = "_this execVM '\goko_uVO\initialise\independent_class_init.sqf'";
			};
		};	
	};
};
	