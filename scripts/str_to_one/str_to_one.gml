/// @desc str_to_one
/// @arg num

var _n = argument[0];

var _r = 0x1;

var _i = 0;
repeat (_n - 1) {
	_r = (_r << 1) + 0x1;
	
	_i += 1;
}

return _r