/// @desc change_rgb
/// @arg name
/// @arg value

var _name  = argument[0];
var _value = argument[1];

var _r = -1;
var _g = -1;
var _b = -1;

with (obj_die_rolling) {
	_r = color_get_red(image_blend);
	_g = color_get_green(image_blend);
	_b = color_get_blue(image_blend);

	switch (_name) {
		case "R":
			_r = _value;
			break;
		case "G":
			_g = _value;
			break;
		case "B":
			_b = _value;
			break;
	}

	image_blend = make_color_rgb(_r, _g, _b);
}

if (_r != -1 or _g != -1 or _b != -1) {
	die_rgb = int_to_hex(_r) + int_to_hex(_g) + int_to_hex(_b);
	show_debug_message("change for " + string(_name) + " to " + string(_value) + " (" + die_rgb + ")" );
}