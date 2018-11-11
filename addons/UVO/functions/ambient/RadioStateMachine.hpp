class UVO_ambientRadioStateMachine
{
	list = "allGroups select {_x getVariable ['UVO_groupEnable',false]}";
	skipNull = 1;
	
	class Standby {
		onStateEntered = "_this setVariable ['UVO_ambInterval',(diag_tickTime + (random 40 + random 40))];";

		class intervalComplete {
			targetState = "Manifest";
			condition = "_this call UVO_fnc_intervalCheck";
		};
	};

	class Manifest {
		onStateEntered = "_this remoteExec ['UVO_fnc_ambientRadio',_this]";
		
		class Standby {
			targetState = "Standby";
			condition = "true";
		};
	};
};
