/// @desc map_get_deep
/// @arg map
/// @arg key1...

var _map = argument[0];

var _result = _map;

var _num = argument_count - 1;
var _a, _v;

var _i = 1;
repeat (_num) {
	_a = argument[_i];
	
	_v = ds_map_find_value(_result, _a);
	
	if (is_undefined(_v)) {
		show_debug_message("key " + string(_a) + " not found within the map.");
		_result = noone;
		break;
	}
	
	_result = _v;
	
	_i += 1;	
}

return _result;


