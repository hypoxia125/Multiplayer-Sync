private _players = [true] call MPSync_fnc_getPlayers;

if (count _players <= 0) exitWith { false };

_players findIf {
	private _spawned = _x getVariable ["MPSync_PlayerSpawned", false];
	!(_spawned)
} == -1