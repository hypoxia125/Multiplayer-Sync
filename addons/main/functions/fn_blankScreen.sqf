params [
	["_state", 1, [-1]],
	["_noText", false, [true]]
];

(missionNamespace getVariable ["MPSync_Parameters", []]) params ["_minPlayers", "_timeout"];

switch _state do {

	case 0: {
		diag_log format ["MPSync.blankScreen | Releasing Screen"];

		private _layer = uiNamespace getVariable "MPSync_IBlankLayer";
		if (isNil "_layer") exitWith {};

		private _txt = "$STR_MPSync_notification_playersready" call BIS_fnc_localize;
		if (_noText) then { _txt = "" };
		_layer cutText [_txt, "BLACK IN", 3, true, true];
		uiNamespace setVariable ["MPSync_IBlankLayer", nil];
	};

	case 1: {
		diag_log format ["MPSync.blankScreen | Dimming Screen"];

		private _layer = uiNamespace getVariable "MPSync_IBlankLayer";
		if (isNil "_layer") then {
			_layer = "MPSync_IBlankLayer" call BIS_fnc_rscLayer;
			uiNamespace setVariable ["MPSync_IBlankLayer", _layer];
		};

		private _txt = format ["%1<br/>Minimum Players: %2<br/>Timeout: %3 Seconds","$STR_MPSync_notification_waitingforplayers" call BIS_fnc_localize, _minPlayers, _timeout];
		if (_noText) then { _txt = "" };
		_layer cutText [_txt, "BLACK OUT", 1e-10, true, true];
	};
};