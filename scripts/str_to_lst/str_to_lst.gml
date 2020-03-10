/// @desc str_to_lst
/// @arg string
/// @arg sep
/// @arg is_numbers

var _s = argument[0];
var _sep = argument[1];

var _is_num = 0;
if (argument_count >= 2) {
	_is_num = argument[2];
}

var _len = string_length(_s);
var _amt = string_count(_sep, _s);

// If string wrapped in "[...]", 
//    grab only what is between them
if (string_char_at(_s, 1) == "[" and string_char_at(_s, _len) == "]") {
	_s = string_copy(_s, 2, _len - 2);
}

var _result;
var _c
var _t = "";

var _n = 0;
var _i = 1;
repeat (string_length(_s)) {
	_c = string_char_at(_s, _i);
	
	if (_c != _sep) {
		_t += _c;	
	} else {
		if (_is_num == true) {
			_t = real(_t);
		}
		
		_result[_n] = _t;
		_t = "";
		_n += 1;
	}	
	
	_i += 1;
}

// Since not adding until was a comma,
//    need to add the last section here
if (_is_num == true) {
	_t = real(_t);
}
		
_result[_n] = _t;

return _result;