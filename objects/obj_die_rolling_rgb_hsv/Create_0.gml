/// @description 

#region Setup Die

global.rolling = false;

var _r = -1;
var _g = -1;
var _b = -1;
var _h = -1;
var _s = -1;
var _v = -1;
var _die_x_o, _die_y_o;

with (obj_die_rolling) {
	_die_x_o = x - (sprite_width / 3);
	_die_y_o = y - (sprite_height / 2);
	
	_r = color_get_red(image_blend);
	_g = color_get_green(image_blend);
	_b = color_get_blue(image_blend);
	_h = color_get_hue(image_blend);
	_s = color_get_saturation(image_blend);
	_v = color_get_value(image_blend);
	
	drop_move = false;
}

die_rgb = int_to_hex(_r) + int_to_hex(_g) + int_to_hex(_b);
die_hsv = int_to_hex(_h) + int_to_hex(_s) + int_to_hex(_v);

die_rgb_x = _die_x_o;
die_rgb_y = _die_y_o - 20;

die_hsv_x = _die_x_o;
die_hsv_y = _die_y_o;

#endregion