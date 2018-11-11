class UVO_ambientGenericStateMachine
{
	list = "allUnits select {!isNil {_x getVariable 'UVO_unitNationality'}}";
	skipNull = 1;
	
	class Standby {
		onStateEntered = "_this setVariable ['UVO_ambInterval',(diag_tickTime + (30 + random 50 + random 50))];";

		class intervalComplete {
			targetState = "Manifest";
			condition = "_this call UVO_fnc_intervalCheck";
		};
	};

	class Manifest {
		onStateEntered = "_this remoteExec ['UVO_fnc_ambientGeneric',_this]";
		
		class Standby {
			targetState = "Standby";
			condition = "true";
		};
	};
};
