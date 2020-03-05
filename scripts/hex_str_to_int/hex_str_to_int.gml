/// @desc hex_str_to_int
/// @arg value

// u/DragoniteSpam : https://www.reddit.com/r/gamemaker/comments/9nyjbu/hexstringtonumber_script/

var _input = argument[0];

var _result = 0;

var ZERO = ord("0");
var NINE = ord("9");
var    A = ord("A");
var    F = ord("F");

var _c;

var _i = 0;
repeat (string_length(_input)) {
	_c = string_ord_at(string_upper(_input), _i);
	
	_result = _result << 4;
	
	if (_c >= ZERO and _c <= NINE) {
		_result += (_c - ZERO);
	} else if (_c >= A and _c <= F) {
		_result += (_c - A + 10);
	} else {
		// Error	
	}

	_i += 1;
}

return _result;