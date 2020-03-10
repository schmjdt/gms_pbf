// Return a list of dice names based on down and yardage

var _map = pbf_play_selector_map;
var _possession, _amt, _min, _max;
var _c, _i, _t, _l;

if (possession == Team.home) {
	_possession = "defense";
} else {
	_possession = "offense";	
}

var _down = map_get_deep(_map, _possession, down);
var _k = ds_map_find_first(_down);
var _y = yards_to_first;

while (!is_undefined(_k)) {
	_min = "";
	_max = "";
	show_debug_message(_k);
	
	_l = str_to_lst(_k, "-", true);
	_min = real(_l[0]);
	if (array_length_1d(_l) == 2) {
		_max = real(_l[1]);	
	}
	
	if (_max == "") {
		if (_y >= _min) {
			break;	
		}
	} else {
		if (_y >= _min and _y <= _max) {
			break;	
		}
	}
	
	_k = ds_map_find_next(_down, _k);
}

// TODO: Figure out which yard key using based on yards_to_first

var _play = map_get_deep(_down, _k, "play");
var _mods = map_get_deep(_down, _k, "mods");

show_debug_message("play: " + string(_play));

