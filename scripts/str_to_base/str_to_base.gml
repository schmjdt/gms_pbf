/// @desc str_to_base
/// @arg string
/// @arg base

var _input = string_upper(argument[0]);
var _base = real(argument[1]);

var _l = string_length(_input);

var _result = 0;
var _ALPHANUMERIC = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

if (_base < 1 or _base > 36) return _result;

var _e = 0;
var _i = _l;

repeat (_l) {
	var _c = string_char_at(_input, _i);
	
	var _n = 1;
	repeat (36) {
		if (_c == string_char_at(_ALPHANUMERIC, _n)) {
			break;	
		}

		_n += 1;
	}
		
	_result += (_n - 1) * power(_base, _e);

	_e += 1;
	_i -= 1;
}

return _result;

