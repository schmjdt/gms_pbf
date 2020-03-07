/// @desc change_hsb
/// @arg name
/// @arg value

var _name  = argument[0];
var _value = argument[1];

var _h = -1;
var _s = -1;
var _v = -1;

with (obj_die_rolling) {
	_h = color_get_hue(image_blend);
	_s = color_get_saturation(image_blend);
	_v = color_get_value(image_blend);

	switch (_name) {
		case "H":
			_h = _value;
			break;
		case "S":
			_s = _value;
			break;
		case "V":
			_v = _value;
			break;
	}

	image_blend = make_color_hsv(_h, _s, _v);
}

if (_h != -1 or _s != -1 or _v != -1) {
	die_hsv = int_to_hex(_h) + int_to_hex(_s) + int_to_hex(_v);
	show_debug_message("change for " + string(_name) + " to " + string(_value) + " (" + die_hsv + ")" );
}