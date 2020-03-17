/*
	c_white:  16777215 - 16777215 | ffffff : 255, 255, 255
	c_red:         255 -      255 | ff0000 : 255,   0,   0
	c_yellow:    65535 -    65535 | ffff00 : 255, 255,   0
	c_lime:      65280 -    65280 | 00ff00 :   0, 255,   0
*/

#region built-in colors
var n_color = [
	"c_white",
	"c_red",
	"c_yellow",
	"c_lime"
]

var c_color = [
	c_white,
	c_red,
	c_yellow,
	c_lime
]
#endregion

#region color hex string
var s_color = [
	"ffffff",
	"ff0000",
	"ffff00",
	"00ff00",
]
#endregion

var _i = 0;
repeat (array_length_1d(s_color)) {
	var _str = n_color[_i] + ": " + string(c_color[_i]) + " - " + string(str_to_color(s_color[_i]));
	show_debug_message(_str);	
	_i += 1;
}