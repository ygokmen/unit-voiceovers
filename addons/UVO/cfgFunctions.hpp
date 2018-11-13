class CfgFunctions
{
	class UVO
	{
		tag = "UVO";
		class ambient
		{
			file = "UVO\functions\ambient";
			class ambientGeneric {};
			class ambientRadio {};
			class intervalCheck {};
		};
		class common
		{
			file = "UVO\functions\common";
			class calloutDir {};
			class confirmKill {};
			class disableUVO {};
			class globalsay3D {};
			class reinitialize {};
			class thrownFrag {};
		};
		class definitions
		{
			file = "UVO\functions\definitions";
			class createNationality {};
			class createNationalityFromConfig {};
			class defaultDefinitions {preInit = 1;};
			class throwableDefinitions {preInit = 1;};
		};
		class eventhandler
		{
			file = "UVO\functions\eventhandler";
			class firedEH {};
			class hitEH {};
			class killedEH {};
			class localEH {};
			class reloadedEH {};
		};
		class init
		{
			file = "UVO\functions\init";
			class CBASettings {};
			class postInit {postInit = 1;};
			class preInit {preInit = 1;};
			class keybinds {postInit = 1;};
			class unitInit {};
		};
	};
};
