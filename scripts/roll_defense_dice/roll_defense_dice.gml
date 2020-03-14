/// @desc roll_defense_dice

var _mDice = global.map_pbf_dice;

var _aDice = global.map_pbf_dice_sets[? "Defense"];

var _num_dice = array_length_1d(_aDice);
global.rolling = str_to_one(_num_dice);

// Reset total dice roll count
var _total = 0;
var _inst, _dice;

var _i = 0;
repeat (_num_dice) {
	_inst = instance_create_layer(
		mouse_x + irandom_range(-64, 64), mouse_y + irandom_range(-64, 64), 
		"Instances", obj_die_rolling
	);
	
	var _id = _aDice[_i];
	var _c = map_get_deep(_mDice, _id, "color");
	var _s = map_get_deep(_mDice, _id, "scale");
	
	with (_inst) {
		image_blend = _c;
		image_xscale = _s[@ 0];
		image_yscale = _s[@ 1];
		die_id = _id;
		
		_total += side;
	}
		
	_dice[_i] = _inst;
		
	_i += 1;
}

// Save the list of dice instances to be destroyed later
list_of_dice = _dice;
	
return _total;