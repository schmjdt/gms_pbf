/// @desc roll_random_dice
/// @arg amount
/// @arg clear

var _num = argument[0];

var _clear = false;
if (argument_count > 1) _clear = argument[1];

// Reset total dice roll count
var _total = 0;

global.rolling = 0x3f >> (6 - _num);

// Destroy any previously rolled dice
if (_clear) {
	with (obj_die_rolling) {
		instance_destroy();	
	}
}

var _x = x_room; // mouse_x;
var _y = y_room; // mouse_y;

repeat (_num) {
	var _inst = instance_create_layer(
		_x + irandom_range(-64, 64), _y + irandom_range(-64, 64), 
		"Instances", obj_die_rolling
	);
		
	_total += _inst.side;
}

return _total;