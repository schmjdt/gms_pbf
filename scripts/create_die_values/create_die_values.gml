/// @desc create_die_values
/// @arg min
/// @arg max

var _result = [];

var _values = range(argument[0], argument[1]);
var _values_len = array_length_1d(_values);

var _b, _c, _s;

#region Getting which size die

//var _available_dice = [6, 8, 10, 12, 20];
var _available_dice = [6];
var _available_dice_len = array_length_1d(_available_dice)
var _die_size = -1;

_c = 0;
repeat (_available_dice_len) {
	var _t = _available_dice[@ _c];
	if (_t mod _values_len == 0) {
		_die_size = _t;
		break;
	}
	_c += 1;
}

if (_die_size == -1) {
	show_debug_message(string(_values) + " is not valid");
	return _result;
}

#endregion

#region Create values to match die

_s = _die_size / _values_len;

_b = 0
_c = 0;
repeat (_die_size) {
	if (_c > 0 and _c mod _s == 0) _b += 1;
	_result[_c] = _values[_b];
	_c += 1;
}

show_debug_message(_result);

#endregion 

return _result;