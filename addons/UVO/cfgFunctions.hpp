class CfgFunctions {
	class UVO {
		tag = "UVO";
		class common {
			file = "UVO\functions\common";
			class addUVO {};
			class allyDown {};
			class calloutDir {};
			class CBASettings {};
			class confirmKill {};
			class disableUVO {};
			class enableSentences {};
			class globalSay3D {};
			class init {};
			class initPost {};
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
		class suppressed {
			file = "UVO\functions\suppressed";
			class targetIsAI {};
			class targetIsPlayer {};
		}
	};
};
