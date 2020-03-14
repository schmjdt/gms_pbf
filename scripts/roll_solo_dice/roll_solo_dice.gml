/// @desc roll_solo_dice

var _mDice = global.map_pbf_dice;

var _aPlaySelector = get_dice_solo_play_selector();

var _aDice = _aPlaySelector[@ 0];
var _aMods = _aPlaySelector[@ 1];

var _num_dice = array_length_1d(_aDice);
global.rolling = str_to_one(_num_dice);

// Reset total dice roll count
var _total = 0;
var _winning_play = noone;
var _inst, _dice, _value;

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
		
		side = clamp(side + _aMods[_i], 1, 6);		
		// TEST: Set all dice to side 1 and verify rules
		//side = 1;
	}
		
	_dice[_i] = _inst;
		
	_i += 1;
}

// Save the list of dice instances to be destroyed later
list_of_dice = _dice;
	
// Get winning die based on priority of order of dice
_i = _num_dice - 1;
repeat (_num_dice) {
	
	_inst = _dice[_i];
	
	if (_inst.side >= _total) {
		_total = _inst.side;
		_winning_play = _inst.die_id;
	}
	
	_i -= 1;
}

return _winning_play;