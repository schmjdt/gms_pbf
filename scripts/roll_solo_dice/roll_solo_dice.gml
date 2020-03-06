/// @desc roll_solo_dice

// TODO: Grab this order from data based on down/yards
var _order = "321";

var _num = string_length(_order);
game.rolling = 0x7; // str_to_bin(string_repeat("1", _num));

// Reset total dice roll count
var _total = 0;
var _result = noone;

// Destroy any previously rolled dice
with (obj_die_rolling) {
	instance_destroy();	
}

var _inst, _dice, _value;

var _o = 1;
var _i = 0;
repeat (_num) {
	_inst = instance_create_layer(
		mouse_x + irandom_range(-64, 64), mouse_y + irandom_range(-64, 64), 
		"Instances", obj_die_rolling
	);
	
	var _id = string_char_at(_order, _o);
	var _tmp = pbf_plays_map[? _id];
	
	with (_inst) {
		image_blend  = _tmp[? "color"];
		play_id = _id;
	}
		
	_dice[_i] = _inst;
		
	_o += 1;
	_i += 1;
}

// Get winning die based on priority of order of dice
_i = _num - 1;
repeat (_num) {
	
	_inst = _dice[_i];
	
	if (_inst.side >= _total) {
		_total = _inst.side;
		_result = _inst.play_id;
	}
	
	_i -= 1;
}

return _result;