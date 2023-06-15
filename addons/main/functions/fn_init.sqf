params [
	["_minPlayers", call MPSync_fnc_getTotalSlots, [-1]],
	["_timeout", 60, [-1]]
];

if !(isMultiplayer) exitWith {};
if (!isNil { missionNamespace getVariable "MPSync_EndTime" }) exitWith {};

if (isServer) then {
	diag_log format ["MPSync.initServer | Starting"];

	missionNamespace setVariable ["MPSync_StartTime", serverTime, true];

	call MPSync_fnc_initServer;
};

if (hasInterface) then {
	diag_log format ["MPSync.initPlayer | Starting"];

	call MPSync_fnc_initPlayer;
};

waitUntil {
	!isNil { missionNamespace getVariable "MPSync_EndTime" }
};

diag_log format ["MPSync | Everything is complete. Enjoy your game!"];