/// @desc str_to_mod
/// @arg string

// -#d#-#
// multiplier, amount, range

var _s = argument[0];
var _multiplier, _amount, _range, _value;

// Parse out the multiplier (positive or negative)
_multiplier = 1;
if (string_char_at(_s, 1) == "-") {
	_multiplier = -1;
	_s = string_copy(_s, 2, string_length(_s) - 1);
}
	
// Split up the "d"
var _d = str_to_lst(_s, "d", false);
var _l = array_length_1d(_d);

var _amount = real(_d[@ 0]);

if (_l == 1) {
	_range = -1;
} else {
	_range = str_to_lst(_d[@ 1], "-", true);	
}

// Gain/Lose Modifier, Dice Sides, d-size of dice
return [_multiplier, _amount, _range];

