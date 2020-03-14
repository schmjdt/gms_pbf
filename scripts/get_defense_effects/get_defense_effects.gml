/// @desc get_defense_effects
/// @arg roll

var _roll = argument[0];

var _mDefense = global.map_pbf_rules_defense;

var _pOffense = global.pbf_play_offense;
var _pDefense = global.pbf_play_defense;

// Get the rules for the current defense vs offense
var _mVs = map_get_deep(_mDefense, _pOffense, _pDefense);
// TODO: Error Handling - if no match found

#region Find Matching First Rules
// Cycle through each rule until find matching roll key
var _kRoll = ds_map_find_first(_mVs);

var _min, _max, _l;
while (!is_undefined(_kRoll)) {
	// Get the min-max roll range from rules
	// If is a single   value, then will match ==
	// If is a range of value, then will match between inclusive
	
	_min = "";
	_max = "";
	
	_l = str_to_lst(_kRoll, "-", true);
	_min = real(_l[@ 0]);
	
	if (array_length_1d(_l) == 2) {
		_max = real(_l[@ 1]);	
	}
	
	// If find match, break out
	if (_max == "") {
		if (_roll == _min)					   break;	
	} else {
		if (_roll >= _min and _roll <= _max) break;
	}
	
	// No match, get next map
	_kRoll = ds_map_find_next(_mVs, _kRoll);
}
#endregion

var _aEffects = map_get_deep(_mVs, _kRoll, "effects");
var _aMods	  = map_get_deep(_mVs, _kRoll, "mods");
// TODO: Error Handling - if no match found

return [_aEffects, _aMods];