[] spawn {
	scriptName "MPSync.initPlayer";

	// Blank Screen
	[1] call MPSync_fnc_blankScreen;

	// Select Template
	private _respawnCfg = call MPSync_fnc_getRespawnConfig;
	_respawnCfg params ["_respawnOnStart", "_templates"];

	// Menu Position w/ Respawn Template
	if (_respawnOnStart == 1 && "MenuPosition" in _templates) then {
		waitUntil {
			// registered
			!(isNull player)
			&&
			// player respawned
			{
				!(alive player)
				&&
				{ visiblemap };
			}
		};
	}
	// everything else
	else {
		waitUntil {
			// registered
			!(isNull player)
			&&
			// player spawned
			{ alive player };
		};
	};

	// disable player
	[player, false] remoteExec ["enableSimulationGlobal", 2];
	[player, true] remoteExec ["hideObjectGlobal", 2];

	// wait for server to tell clients to wake up
	waitUntil {
		missionNamespace getVariable ["MPSync_PlayersSpawned", false];
	};

	// wake clients up
	[0] call MPSync_fnc_blankScreen;
	[player, true] remoteExec ["enableSimulationGlobal", 2];
	[player, false] remoteExec ["hideObjectGlobal", 2];

	// script complete
	diag_log format ["MPSync.initPlayer | Completed for %2", name player];
};