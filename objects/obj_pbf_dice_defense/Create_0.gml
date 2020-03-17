/// @description 

event_inherited();

var _total = roll_defense_dice();
game.total_count = _total;

var _effects = get_defense_effects(_total);

var _aEffects = _effects[@ 0];
var _aMods = _effects[@ 1];

var _l = array_length_1d(_aEffects);

// TODO: Apply effects and mods

// Only to get effect "string"
// But still have to hard code things q_q
//var _mEffects = global.map_pbf_rules_effects_defense;

var _n = "";
var _v = 0;

var _i = 0;
repeat (_l) {
	var _effect = _aEffects[@ _i];
	var _mod    = _aMods[@ _i];
	//_n += _mEffects[? _id] + "(" + string(_aMods[@ _i]) + ") | ";

	var _e = string_char_at(_effect, 1);

	switch (_e) {
		case "1": // Modifer
			var _mod_result = str_to_mod(_mod);
			var _m = _mod_result[@ 0];
			var _a = _mod_result[@ 1];
			var _r = _mod_result[@ 2];	
			if (_r != -1) {
				// Modifier determines how many dice to roll
				show_debug_message("Roll " + string(_a) + "d" + string(_r)) 
			} else {
				// Modifier determines adjust of roll value
				_v = _m * _a;
			}
			_n += "Modified by " + string(_v);
			
			global.die_modifier = _v;
			break;
		case "2": // Bonus
			switch (_mod) {
				case 0:
					_n += "No Bonus.  ";
					break;
				default:
					_n += "All Bonus of " + string(_mod) + ".  ";
					break;
					
				global.die_bonus = _mod;
			}
			show_debug_message("affects bonus");
			break;
	}

	_i += 1;
}

global.pbf_effects_defense = _n;