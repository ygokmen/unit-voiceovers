class cfgFunctions
{
	class UVO
	{
		tag = "UVO";
		class common
		{
			file = "UVO\functions\common";
			class confirmKill {};
			class globalsay3D {};
			class thrownFrag {};
		};
		class definitions
		{
			file = "UVO\functions\definitions";
			class createNationality {};
			class nationalities {preInit = 1;};
			class throwables {preInit = 1;};
		};
		class eventhandler
		{
			file = "UVO\functions\eventhandler";
			class firedEH {};
			class hitEH {};
			class killedEH {};
			class reloadedEH {};
		};
		class init
		{
			file = "UVO\functions\init";
			//class CBASettings {preInit = 1};
			class classInit {};
			class init {preInit = 1;};
			//class keybinds {postInit = 1};
		};
	};
};