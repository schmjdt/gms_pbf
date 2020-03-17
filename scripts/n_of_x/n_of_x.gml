/// @desc n_of_x
/// @arg n
/// @arg x

var _n = argument[0];
var _x = argument[1];

var _result = [];

var _i = 0;
repeat (_n) {
	_result[_i] = _x;
	
	_i += 1;
}

return _result;
