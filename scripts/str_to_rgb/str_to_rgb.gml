/// @desc str_to_rgb
/// @arg value

var _input = argument[0];
var _result;

var _len = string_length(_input); 

if (_len != 6) {
	// Not a color string
	return -1;	
}

var _n = 0;
var _i = 1;
repeat (_len / 2) {
	_result[_n] = hex_str_to_int(string_copy(_input, _i, 2));	
	
	_n += 1;
	_i += 2;
}

return _result;