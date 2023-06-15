private _totalPlayers = 0;
[east, west, independent] apply {
	_totalPlayers = _totalPlayers + playableSlotsNumber _x;
};

// return
_totalPlayers;