/// @desc get_dice_solo_play_selector

/** Return a list of dice names and modifiers based on certain fields

	type  -- ball possession
	down  -- current down
	first -- distance to first down
	ball  -- field position of ball - NotImplemented
*/

// TODO: Add additional field position modifier rule set

var _mPlays = global.map_pbf_rules_solo_play_selector;

#region Get Field Stats

var _mField = global.map_field;

var _team  = _mField[? "team"];
var _down  = _mField[? "down"];
var _first = _mField[? "first"];
var _ball  = _mField[? "ball"];

var _type;
if (_team == Team.home) _type = "defense";
else                    _type = "offense";	

#endregion

// Get the rules for the current type and down
var _mDown = map_get_deep(_mPlays, _type, _down);
// TODO: Error Handling - if no match found

#region Find Matching First Rules
// Cycle through each rule until find matching first key
var _kFirst = ds_map_find_first(_mDown);

var _min, _max, _l;
while (!is_undefined(_kFirst)) {
	// Get the min-max first range from rules
	// If is a single   value, then will match >=
	// If is a range of value, then will match between inclusive
	
	_min = "";
	_max = "";
	
	_l = str_to_lst(_kFirst, "-", true);
	_min = real(_l[@ 0]);
	
	if (array_length_1d(_l) == 2) {
		_max = real(_l[@ 1]);	
	}
	
	// If find match, break out
	if (_max == "") {
		if (_first >= _min)					   break;	
	} else {
		if (_first >= _min and _first <= _max) break;
	}
	
	// No match, get next map
	_kFirst = ds_map_find_next(_mDown, _kFirst);
}
#endregion

var _aDice = map_get_deep(_mDown, _kFirst, "dice");
var _aMods = map_get_deep(_mDown, _kFirst, "mods");
// TODO: Error Handling - if no match found

return [_aDice, _aMods];