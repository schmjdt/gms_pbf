/// @desc roll_random_dice
/// @arg amount

var _num = argument[0];

// Reset total dice roll count
var _total = 0;

game.rolling = 0x3f >> (6 - _num);

// Destroy any previously rolled dice
with (obj_die_rolling) {
	instance_destroy();	
}

repeat (_num) {
	var _inst = instance_create_layer(
		mouse_x + irandom_range(-64, 64), mouse_y + irandom_range(-64, 64), 
		"Instances", obj_die_rolling
	);
		
	_total += _inst.side;
}

return _total;