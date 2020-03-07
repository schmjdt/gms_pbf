/// @desc int_to_hex
/// @arg value

// https://www.gmlscripts.com/script/dec_to_hex

var _input = argument[0];

var _result, _b, _h, _l;
var _HEX = "0123456789ABCDEF";

if (_input) {
	_result = "" 
} else { 
	_result = "00";
}

while (_input) {
	_b = _input & 255;
	_h = string_char_at(_HEX, _b div 16 + 1);
	_l = string_char_at(_HEX, _b mod 16 + 1);
	_result = _h + _l + _result;
	_input = _input >> 8;
}

return _result;