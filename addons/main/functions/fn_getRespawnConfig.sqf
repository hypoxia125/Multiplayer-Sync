private _side = side group player;

// Respawn Start
private _respawnOnStart = getNumber (missionConfigFile >> "respawnOnStart");

// Templates
private _templates = getArray (missionConfigFile >> "respawnTemplates");
if (isClass (missionConfigFile >> format ["respawnTemplates%1", _side])) then {
	_templates = getArray (missionConfigFile >> format ["respawnTemplates%1", _side])
};

// Return
[_respawnOnStart, _templates];