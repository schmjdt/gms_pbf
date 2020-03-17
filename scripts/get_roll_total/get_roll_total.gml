/// @desc get_roll_total
/// @arg dice
/// @arg values

var _aDice = argument[0];
var _l = array_length_1d(_aDice);

var _aVals = -1;
if (argument_count >= 2) {
	_aVals = argument[1];
}

var _inst;
var _total = 0;

var _i = 0;
repeat (_l) {
	_inst = _aDice[@ _i];
	
	if (_aVals != -1) {
		_total += _aVals[_inst.side - 1];	
	} else {
		_total += _inst.side;
	}	
	
	_i += 1;
}

return _total;
