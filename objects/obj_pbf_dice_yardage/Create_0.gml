/// @description 

event_inherited();

var _total = 0;

if (global.die_amount > 0) {
	var _aSet = n_of_x(global.die_amount, "410");
	
	var _aDice = roll_pbf_dice(_aSet);
	
	var _aValues = create_die_values(global.die_values);
	
	_total = get_roll_total(_aDice, _aValues);
}

//var _total = roll_yardage_dice();
_total += global.die_modifier
_total *= global.die_multiplier

game.total_count = _total;

var _n = _total;

global.pbf_effects_yardage = _n;
