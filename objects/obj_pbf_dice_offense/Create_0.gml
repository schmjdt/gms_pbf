/// @description 

event_inherited();

var _total = roll_offense_dice();
_total += global.die_modifier;

game.total_count = _total;

var _effects = get_offense_effects(_total);

var _aEffects = _effects[@ 0];
var _aMods = _effects[@ 1];

// TODO: Apply effects and mods

//var _mEffects = global.map_pbf_rules_effects_offense;
var _l = array_length_1d(_aEffects);

var _n = "";

var _i = 0;
repeat (_l) {
	var _id = _aEffects[@ _i];
	//_n += _mEffects[? _id] + "(" + string(_aMods[@ _i]) + ") | ";
	_n += _id + "(" + string(_aMods[@ _i]) + ") | ";

	_i += 1;
}

global.pbf_effects_offense = _n;

global.die_modifier = 0;
global.die_bonus = -1;