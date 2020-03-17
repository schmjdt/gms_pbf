/// @description 

event_inherited();

var _aSet = global.map_pbf_dice_sets[? "Offense"];
var _aDice = roll_pbf_dice(_aSet);
var _total = get_roll_total(_aDice);

//var _total = roll_offense_dice();

_total += global.die_modifier;

game.total_count = _total;

var _effects = get_offense_effects(_total);

var _aEffects = _effects[@ 0];
var _aMods = _effects[@ 1];
var _aDesc = _effects[@ 2];

var _l = array_length_1d(_aEffects);

// TODO: Apply effects and mods

//var _mEffects = global.map_pbf_rules_effects_offense;

var _n = "";
var _m = 0;
var _e, _b, _d;

var _i = 0;
repeat (_l) {
	var _effect = _aEffects[@ _i];
	var _mod    = _aMods[@ _i];
	var _desc   = _aDesc[@ _i];
	
	_e = string_char_at(_effect, 1);
	
	switch (_e) {
		case "1": // Modifer
			_m += _mod;
			break;
		case "3": // Die roll
			global.die_bonus = real(string_char_at(_effect, 3));
			
			_d = str_to_mod(_mod);
			
			global.die_multiplier = _d[@ 0];
			global.die_amount     = _d[@ 1];
			global.die_values     = _d[@ 2];
			break;
		default:
			_m += 0;
	}
	
	//_n += _mEffects[? _id] + "(" + string(_aMods[@ _i]) + ") | ";
	_n += _effect + "(" + string(_mod) + ") " + _desc + " | ";

	_i += 1;
}

global.pbf_effects_offense = _n;

global.die_modifier = _m;