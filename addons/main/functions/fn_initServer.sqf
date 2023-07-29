params [
	["_minPlayers", call MPSync_fnc_getTotalSlots, [-1]],
	["_timeout", 60, [-1]]
];

scriptName "MPSync.initServer";

if !(canSuspend) exitWith { _this spawn MPSync_fnc_initServer };

waitUntil {
    count ([true] call MPSync_fnc_getPlayers) > 0
};
waitUntil {
	private _players = [true] call MPSync_fnc_getPlayers;
	_players findIf {
		private _spawned = _x getVariable ["MPSync_PlayerSpawned", false];
		(_spawned)
	} != -1
};
diag_log format ["MPSync.initServer | At least one player has spawned... | Time: %1", time toFixed 0];

private _currentTime = time;
waitUntil {
	call MPSync_fnc_allPlayersSpawned
	||
	time >= _currentTime + _timeout;
};

missionNamespace setVariable ["MPSync_PlayersSpawned", true, true];
missionNamespace setVariable ["MPSync_EndTime", time, true];

// script complete
diag_log format ["MPSync.initServer | Completed @ %1", time];