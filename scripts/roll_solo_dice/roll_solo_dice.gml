/// @desc roll_solo_dice

// TODO: Grab this order from data based on down/yards
var _order = ["130", "120", "110", "130", "120", "110"];
var _modify = [0, 0, 0, 0, 0, 0];

var _num = array_length_1d(_order);
global.rolling = str_to_one(_num);

// Reset total dice roll count
var _total = 0;
var _result = noone;
var _inst, _dice, _value;

// Destroy any previously rolled dice
with (obj_die_rolling) {
	instance_destroy();	
}


var _i = 0;
repeat (_num) {
	_inst = instance_create_layer(
		mouse_x + irandom_range(-64, 64), mouse_y + irandom_range(-64, 64), 
		"Instances", obj_die_rolling
	);
	
	var _id = _order[_i];
	var _c = map_get_deep(map_pbf_dice, _id, "color");
	var _s = map_get_deep(map_pbf_dice, _id, "scale");
	
	with (_inst) {
		image_blend = _c;
		image_xscale = _s[@ 0];
		image_yscale = _s[@ 1];
		die_id = _id;
		side = clamp(side + _modify[_i], 1, 6);
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
		_result = _inst.die_id;
	}
	
	_i -= 1;
}

return _result;