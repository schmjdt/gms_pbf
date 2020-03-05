// Return a list of dice names based on down and yardage

var _names = ["Run", "Short Pass", "Long Pass"];
var _colors = [c_red, c_yellow, c_lime];

var _t = "123";


var _i = 1;
repeat (string_length(_t)) {

	show_debug_message(game.play_names[string_char_at(_t, _i)]);
	
	_i += 1;
}
