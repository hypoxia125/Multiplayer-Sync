params [
	["_includeDead", true, [true]]
];

private _players = allUnits select {isPlayer _x};
private _dead = allDead select {isPlayer _x};

if !(_includeDead) exitWith { _players };

_players + _dead