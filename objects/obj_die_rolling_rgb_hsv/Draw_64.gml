/// @description 

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