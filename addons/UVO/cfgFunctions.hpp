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
			class suppressed {};
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
			class hitEH {};
			class killedEH {};
			class localEH {};
			class reloadedEH {};
			class firedManEH {};
		};
		class init {
			file = "UVO\functions\init";
			class CBASettings {};
			class postInit {};
			class preInit {};
			class unitInitPost {};
		};
	};
};
