#include "CfgFunctions.hpp"
#include "CfgPatches.hpp"
#include "CfgSounds.hpp"
#include "functions\ambient\GenericStateMachine.hpp"
#include "functions\ambient\RadioStateMachine.hpp"

class Extended_PreInit_EventHandlers {
	class UVO_CBASettings {
		init = "call UVO_fnc_CBASettings";
	};
};

class Extended_PostInit_EventHandlers {
	class UVO_postInit {
		init = "call UVO_fnc_postInit";
	};
};
