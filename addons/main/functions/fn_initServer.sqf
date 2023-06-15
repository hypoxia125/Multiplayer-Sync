params [
	["_minPlayers", call MPSync_fnc_getTotalSlots, [-1]],
	["_timeout", 60, [-1]]
];

scriptName "MPSync.initServer";

if !(canSuspend) exitWith { _this spawn MPSync_fnc_initServer };

private _currentTime = serverTime;
waitUntil {
	call MPSync_fnc_allPlayersSpawned
	||
	serverTime >= _currentTime + _timeout;
};

missionNamespace setVariable ["MPSync_PlayersSpawned", true, true];
missionNamespace setVariable ["MPSync_EndTime", serverTime, true];

// script complete
diag_log format ["MPSync.initServer | Completed @ %1", serverTime];