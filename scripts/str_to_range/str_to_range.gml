/// @desc str_to_range
/// @arg string

var _str = argument[0];

var _aList = str_to_lst(_str, "-", true);

// _aList could only be length 1, but range will handle it
var _aResult = range(_aList[@ 0], _aList[@ 1]);

return _aResult;