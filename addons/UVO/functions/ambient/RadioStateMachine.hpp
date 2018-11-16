class UVO_ambientRadioStateMachine
{
	list = "allGroups select {_x getVariable ['UVO_groupEnable',false]}";
	skipNull = 1;
	
	class Standby {
		onStateEntered = "_this setVariable ['UVO_ambInterval',(CBA_missionTime + (20 + random 60))];";

		class intervalComplete {
			targetState = "Manifest";
			condition = "_this call UVO_fnc_intervalCheck";
		};
	};

	class Manifest {
		onStateEntered = "_this remoteExec ['UVO_fnc_ambientRadio',groupOwner _this]";
		
		class Standby {
			targetState = "Standby";
			condition = "true";
		};
	};
};
