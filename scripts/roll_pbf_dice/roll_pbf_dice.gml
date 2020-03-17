/// @desc roll_pbf_dice
/// @arg ids
/// @arg mod

var _mDice = global.map_pbf_dice;

var _aIds = argument[0];
var _num_dice = array_length_1d(_aIds);

var _aMods = n_of_x(_num_dice, 0);
if (argument_count >= 2) {
	if (array_length_1d(_aMods) == _num_dice) {
		_aMods = argument[1];
	}
}

global.rolling = str_to_one(_num_dice);

var _aDice, _inst, _side, _size, _id, _c, _s;

var _i = 0;
while (_i < _num_dice) {
	// TODO: Make die rolling customizable (e.g. d6 vs d20)
	_inst = instance_create_layer(
		mouse_x + irandom_range(-64, 64), mouse_y + irandom_range(-64, 64), 
		"Instances", obj_die_rolling
	);
	
	// TODO: Make max side size customizable
	_size = 6;
		
	_id = _aIds[_i];
	_c = map_get_deep(_mDice, _id, "color");
	_s = map_get_deep(_mDice, _id, "scale");
	
	with (_inst) {
		image_blend = _c;
		image_xscale = _s[@ 0];
		image_yscale = _s[@ 1];
		die_id = _id;
		
		// TEST: To make certain die rolls
		if (_id == "410") {
			switch (_i) {
				case 0: side = 5; break;
				case 1: side = 6; break;
				case 2: side = 6; break;
				default: side = clamp(side + _aMods[_i], 1, _size);
			}
		} else if (_id == "310") {
			switch (_i) {
				case 0: side = 6; break;
				case 1: side = 1; break;
				case 2: side = 6; break;
				default: side = clamp(side + _aMods[_i], 1, _size);
			}
		} else {
			side = clamp(side + _aMods[_i], 1, _size);
		}
				
		_side = side;
	}
		
	_aDice[_i] = _inst;
	
	if (global.die_bonus > 0) {
		if (_side >= (6 - (global.die_bonus - 1))) {
			_aIds[_num_dice] = _id;
			_aMods[_num_dice] = 0;
			_num_dice += 1;
		}
	}
		
	_i += 1;
}

list_of_dice = _aDice;
	
return _aDice;