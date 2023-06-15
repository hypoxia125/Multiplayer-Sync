params [
	["_module", objNull, [objNull]],
	["_units", [], [[]]],
	["_activated", true, [true]]
];

private _minPlayers = _module getVariable ["minPlayers", 1];
private _timeout = _module getVariable ["timeout", 60];

[_minPlayers, _timeout] spawn MPSync_fnc_init;