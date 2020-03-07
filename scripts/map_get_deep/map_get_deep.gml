/// @desc map_get_deep
/// @arg map
/// @arg key1...

var _map = argument[0];

var _result = _map;

var _num = argument_count - 1;
var _a;

var _i = 1;
repeat (_num) {
	_a = argument[_i];
	
	_result = _result[? _a];
	
	_i += 1;	
}

return _result;


