[] spawn {
	scriptName "MPSync.initServer";

	waitUntil {
		if (serverTime % 25 == 0) then {
			// waiting for players notification
		};

		call MPSync_fnc_allPlayersSpawned;
	};

	missionNamespace setVariable ["MPSync_PlayersSpawned", true, true];
	missionNamespace setVariable ["MPSync_EndTime", serverTime, true];

	// script complete
	diag_log format ["MPSync.initServer | Completed @ %1", serverTime];
};