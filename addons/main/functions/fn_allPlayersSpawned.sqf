params [
	["_minPlayers", 1, [-1]],
	["_timeout", 60, [-1]]
];

private _players = [true] call MPSync_fnc_getPlayers;
if (count _players <= 0) exitWith { false };

{
	private _spawned = _x getVariable ["MPSync_PlayerSpawned", false];
	!(_spawned)
} count _players >= _minPlayers;