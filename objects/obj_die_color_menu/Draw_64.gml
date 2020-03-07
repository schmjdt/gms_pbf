/// @description menu

#region Setup Vars

var _vw = global.view_width;
var _vh = global.view_height;

var _grid = menu_pages[page];
var _gh = ds_grid_height(_grid);

var _yb = 32;
var _xb = 16;

var _ys = 20; // (_vh / 2) - ((((_gh - 1) / 2) * _yb));
var _xs = 100; // (_vw / 2);

var _yy, _ltx, _lty, _xo, _rtx, _rty, _c;

#endregion

#region Draw Pause Menu "Back"

//_c = c_black;

//draw_rectangle_color(0, 0, _vw, _vh, _c, _c, _c, _c, 0);

#endregion

#region Draw Elements on Left Side

draw_set_valign(fa_middle);
draw_set_halign(fa_right);

_ltx = _xs - _xb;
_yy = 0;

repeat (_gh) {
	_lty = _ys + (_yy * _yb);
	_c = c_white;
	_xo = 0;
	
	if (_yy == menu_option[page]) {
		_c = c_orange;
		_xo = -(_xb / 2);
	}
	
	draw_text_color(_ltx + _xo, _lty, _grid[# 0, _yy], _c, _c, _c, _c, 1);
	
	_yy += 1;
}

#endregion

#region Draw Dividing Line

draw_line(_xs, _ys - _yb, _xs, _lty + _yb);

#endregion

#region Draw Elements on Right Side

draw_set_halign(fa_left);

_rtx = _xs + _xb;
_yy = 0;

repeat (_gh) {
	_rty = _ys + (_yy * _yb);
	
	_c = c_white;
	if (inputting and _yy == menu_option[page]) _c = c_yellow;
		
	switch (_grid[# 1, _yy]) {
		case menu_element_type.slider:
			var _len = 64;
			var _cv = _grid[# 3, _yy];
			var _ca = _grid[# 4, _yy];
			var _cp = ((_cv - _ca[0]) / (_ca[1] - _ca[0]));
						
			draw_line_width(_rtx, _rty, _rtx + _len, _rty, 2);
			draw_circle_color(_rtx + (_cp * _len), _rty, 4, _c, _c, false);
			draw_text_color(_rtx + (_len * 1.2), _rty, string(floor(_cp * 100)) + "%", _c, _c, _c, _c, 1);
			
			break;
	}
	
	_yy += 1;
}

draw_set_valign(fa_top);

#endregion

#region Draw RGB

draw_text_color(die_rgb_x, die_rgb_y, "#", _c, _c, _c, _c, 1);
_c = c_red;  draw_text_color(die_rgb_x + string_width("#"),     die_rgb_y, string_copy(die_rgb, 1, 2), _c, _c, _c, _c, 1);
_c = c_lime; draw_text_color(die_rgb_x + string_width("#00"),   die_rgb_y, string_copy(die_rgb, 3, 2), _c, _c, _c, _c, 1);
_c = c_blue; draw_text_color(die_rgb_x + string_width("#0000"), die_rgb_y, string_copy(die_rgb, 5, 2), _c, _c, _c, _c, 1);

#endregion

#region Draw HSV

_c = c_white;
draw_text_color(die_hsv_x, die_hsv_y, "#", _c, _c, _c, _c, 1);
_c = c_white;  draw_text_color(die_hsv_x + string_width("#"),    die_hsv_y, string_copy(die_hsv, 1, 2), _c, _c, _c, _c, 1);
_c = c_white; draw_text_color(die_hsv_x + string_width("#00"),   die_hsv_y, string_copy(die_hsv, 3, 2), _c, _c, _c, _c, 1);
_c = c_white; draw_text_color(die_hsv_x + string_width("#0000"), die_hsv_y, string_copy(die_hsv, 5, 2), _c, _c, _c, _c, 1);

#endregion