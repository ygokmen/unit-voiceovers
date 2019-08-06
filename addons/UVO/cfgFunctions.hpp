class CfgFunctions {
	class UVO {
		tag = "UVO";
		class common {
			file = "UVO\functions\common";
			class addUVO {};
			class allyDown {};
			class calloutDir {};
			class confirmKill {};
			class disableUVO {};
			class enableSentences {};
			class globalsay3D {};
			class reinitialize {};
			class thrownFrag {};
		};
		class definitions {
			file = "UVO\functions\definitions";
			class createNationality {};
			class createNationalityFromConfig {};
			class defaultNationalities {};
			class defaultDefinitions {};
			class setNationality {};
		};
		class eventhandler {
			file = "UVO\functions\eventhandler";
			class firedEH {};
			class firedManEH {};
			class hitEH {};
			class killedEH {};
			class localEH {};
			class reloadedEH {};
		};
		class init {
			file = "UVO\functions\init";
			class CBASettings {};
			class postInit {};
			class preInit {};
			class unitInitPost {};
		};
		class suppressed {
			file = "UVO\functions\suppressed";
			class targetIsAI {};
			class targetIsPlayer {};
		}
	};
};
