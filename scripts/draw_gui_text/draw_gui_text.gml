/// @description draw_gui_text
/// @arg list
/// @arg x
/// @arg y
/// @arg color


var _lText = argument[0];
var _len = array_length_1d(_lText);
var _x = argument[1];
var _y = argument[2];
var _c = argument[3];

var _fh = string_height("M")
	
var yy = 0;
repeat (_len) {
	draw_text_color(_x, _y + (_fh * yy), _lText[@ yy], _c, _c, _c, _c, 1);
	
	yy += 1;
}

return 20 + _y + (_fh * _len);