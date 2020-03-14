/// @description 

event_inherited();

var _total = roll_defense_dice();
game.total_count = _total;

var _effects = get_defense_effects(_total);

var _aEffects = _effects[@ 0];
var _aMods = _effects[@ 1];

// TODO: Apply effects and mods

var _mEffects = global.map_pbf_rules_effects_defense;
var _l = array_length_1d(_aEffects);

var _n = "";

var _i = 0;
repeat (_l) {
	var _id = _aEffects[@ _i];
	_n += _mEffects[? _id] + "(" + string(_aMods[@ _i]) + ") | ";

	_i += 1;
}

global.pbf_effects_defense = _n;