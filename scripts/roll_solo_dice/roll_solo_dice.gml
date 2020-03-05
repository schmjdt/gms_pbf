/// @desc roll_solo_dice

// TODO: Grab this order from data based on down/yards
var _names = ["Run", "Short Pass", "Long Pass"];
var _colors = [c_red, c_yellow, c_lime];

var _num = array_length_1d(_names);
game.rolling = 0x7;

// Reset total dice roll count
var _total = 0;
var _result = noone;

// Destroy any previously rolled dice
with (obj_die_rolling) {
	instance_destroy();	
}

var _inst, _dice, _value;

var _i = 0;
repeat (_num) {
	_inst = instance_create_layer(
		mouse_x + irandom_range(-64, 64), mouse_y + irandom_range(-64, 64), 
		"Instances", obj_die_rolling
	);
	
	with (_inst) {
		image_blend = _colors[_i];
	}
	
	_dice[_i] = _inst;
		
	_i += 1;
}

// Get winning die based on priority of order of dice
_i = _num - 1;
repeat (_num) {
	
	_inst = _dice[_i];
	
	if (_inst.side >= _total) {
		_total = _inst.side;
		_result = _names[_i];
	}
	
	_i -= 1;
}

return _result;