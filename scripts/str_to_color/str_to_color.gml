/// @desc str_to_color
/// @arg value

var _input = argument[0];
var _result;

var _rgb = str_to_rgb(_input);

if (_rgb == -1 or array_length_1d(_rgb) != 3) {
	// Return the absent of color
	_result = c_black; 
} else {
	show_debug_message(string(_input) + " : " + string(_rgb[0]) + ", " + string(_rgb[1]) + ", " + string(_rgb[2]));
	
	_result = make_color_rgb(_rgb[0], _rgb[1], _rgb[2])
}

return _result;