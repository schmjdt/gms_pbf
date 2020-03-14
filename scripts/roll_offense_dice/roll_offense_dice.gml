/// @desc roll_offense_dice

show_debug_message("==========-- PARSE OFFENSE EFFECTS --==========");

/*
var _csv = [
	["200", "-1d1"]
	["210", "1d3"]
	["211", "2d6"]
]
*/

var _a = "200"; // choose("200", "210", "211");
var _b = "-1d3"; // choose("-1d0-1", "2d6");

var _min = 1;
var _max = 1;
var _bonus = 0;
var _gain_or_lose = 1;
var _sum = 0;

#region Parse Effect

var _i = 1;
repeat (string_length(_a)) {
	var _c = string_char_at(_a, _i);
	
	switch (_i) {
		case 1:
			if (_c == "2") {	
				show_debug_message("Modify d #");
			}
			break;
		case 3:
			show_debug_message("amount of bonus sides: " + _c);
			_bonus = real(_c);
			break;		
	}
	
	_i += 1;	
}

#endregion

show_debug_message("==========-- --==========");

#region Parse Mod

if (string_char_at(_b, 1) == "-") {
	_gain_or_lose = -1;
	_b = string_copy(_b, 2, string_length(_b) - 1);
}

var _l = str_to_lst(_b, "d", false);

var _amt = real(_l[@ 0]);
var _ll = str_to_lst(_l[@ 1], "-", true);

if (array_length_1d(_ll) == 1) {
	_max = _ll[@ 0];
} else {
	_min = _ll[@ 0];
	_max = _ll[@ 1];
}

show_debug_message("roll " + string(_amt) + " dice of range " + string(_min) + " - " + string(_max));

while (_amt > 0) {
	var _r = irandom_range(_min, _max);
	show_debug_message(string(_r));
	
	if (_max - _r < _bonus) {
		_amt += 1;	
		show_debug_message(string(_r) + " caused bonus!")
	}
	
	_sum += _r;
	
	_amt -= 1;
}

_sum *= _gain_or_lose;

#endregion

show_debug_message("Total = " + string(_sum));

show_debug_message("==========-- --==========");

create_die_values(_min, _max);