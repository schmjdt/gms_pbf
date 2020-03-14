/// @description 

var _dice = list_of_dice;
var _len = array_length_1d(_dice);

var _i = 0;
repeat (_len) {
	_inst = _dice[@	_i];
	
	if (instance_exists(_inst)) instance_destroy(_inst);
	
	_i += 1;
}