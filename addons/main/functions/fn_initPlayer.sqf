scriptName "MPSync.initPlayer";

[1, true] call MPSync_fnc_blankScreen;

// Select Template
private _respawnCfg = call MPSync_fnc_getRespawnConfig;
_respawnCfg params ["_respawnOnStart", "_templates"];

// Menu Position w/ Respawn Template
private _respawnAndMenu = (_respawnOnStart == 1 && "MenuPosition" in _templates);
private _respawn = (_respawnOnStart == 1);

switch true do {

	case _respawnAndMenu: {
		waitUntil {
			// registered
			!(isNull player)
			&&
			// player respawned
			{
				!(alive player)
				&&
				{ visiblemap };
			};
		};

		[0, true] call MPSync_fnc_blankScreen;
	};

	case _respawn: {
		waitUntil {
			// registered
			!(isNull player)
			&&
			// player respawned
			{ !(alive player) }
		};
	};

	default {
		waitUntil {
			// registered
			!(isNull player)
			&&
			// player spawned
			{ alive player };
		};
	};
};

waitUntil { alive player };

[1] call MPSync_fnc_blankScreen;

// tell server player has spawned
diag_log format ["MPSync.initPlayer | %1 has spawned", name player];
player setVariable ["MPSync_PlayerSpawned", true, true];

// disable player
diag_log format ["MPSync.initPlayer | Disabling: %1", name player];
[player, false] remoteExec ["enableSimulationGlobal", 2];
[player, true] remoteExec ["hideObjectGlobal", 2];

// wait for server to tell clients to wake up
waitUntil {
	missionNamespace getVariable ["MPSync_PlayersSpawned", false];
};

// wake clients up
diag_log format ["MPSync.initPlayer | Waking Up: %1", name player];
[0] call MPSync_fnc_blankScreen;
[player, true] remoteExec ["enableSimulationGlobal", 2];
[player, false] remoteExec ["hideObjectGlobal", 2];

// script complete
diag_log format ["MPSync.initPlayer | Completed for %2", name player];