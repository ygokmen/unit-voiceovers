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
			class UVO_EAST
			{
				init = "[(_this select 0),'EAST'] call UVO_fnc_classInit";
			};
		};
	};
	class SoldierGB: CAManBase
	{
		class EventHandlers: EventHandlers
		{
			class UVO_GUER
			{
				init = "[(_this select 0),'GUER'] call UVO_fnc_classInit";
			};
		};
	};
	class SoldierWB: CAManBase
	{
		class EventHandlers: EventHandlers
		{
			class UVO_WEST
			{
				init = "[(_this select 0),'WEST'] call UVO_fnc_classInit";
			};
		};
	};
};
