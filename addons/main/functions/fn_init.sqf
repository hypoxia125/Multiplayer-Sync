params [
	["_minPlayers", 1, [-1]],
	["_timeout", 60, [-1]]
];

if !(canSuspend) exitWith { _this spawn MPSync_fnc_init };

if !(isMultiplayer) exitWith {};

// Setting parameters
diag_log format ["MPSync.init | Setting Parameters: %1", _this];
missionNamespace setVariable ["MPSync_Parameters", _this, true];

if (isServer) then {
	diag_log format ["MPSync.initServer | Starting"];

	if (!isNil { missionNamespace getVariable "MPSync_StartTime" }) exitWith {};
	if (!isNil { missionNamespace getVariable "MPSync_EndTime" }) exitWith {};

	missionNamespace setVariable ["MPSync_StartTime", time, true];

	[_minPlayers, _timeout] spawn MPSync_fnc_initServer;
};

if (hasInterface) then {
	diag_log format ["MPSync.initPlayer | Starting"];

	[_minPlayers, _timeout] spawn MPSync_fnc_initPlayer;
};

waitUntil {
	!isNil { missionNamespace getVariable "MPSync_EndTime" }
};

diag_log format ["MPSync | Everything is complete. Enjoy your game!"];