/// @desc range
/// @arg min
/// @arg max

var _min = argument[0];
var _max = argument[1];

var _result = [];

var _m = _min;
var _i = 0;
repeat (_max - _min + 1) {
	_result[_i] = _m + _i;

	_i += 1;
}

return _result;