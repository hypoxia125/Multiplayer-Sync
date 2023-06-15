params [
	["_state", 1, [-1]]
];

switch _state do {

	case 0: {
		private _layer = uiNamespace getVariable "MPSync_IBlankLayer";
		if (isNil "_layer") exitWith {};

		_layer cutText ["", "BLACK IN", 3, true];
	};

	case 1: {
		private _layer = uiNamespace getVariable "MPSync_IBlankLayer";
		if !(isNil "_layer") then {
			_layer = "MPSync_IBlankLayer" call BIS_fnc_rscLayer;
			uiNamespace setVariable ["MPSync_IBlankLayer", _layer];
		};

		_layer cutText ["", "BLACK OUT", 1e-10, true];
	};
};