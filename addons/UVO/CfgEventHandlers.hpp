class Extended_PreInit_EventHandlers {
	class UVO_preInit {
		init = "call compile preprocessFileLineNumbers 'UVO\XEH_preInit.sqf'";
	};
};

class Extended_PostInit_EventHandlers {
	class UVO_postInit {
		init = "call compile preprocessFileLineNumbers 'UVO\XEH_postInit.sqf'";
	};
};
