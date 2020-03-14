/// @desc load_dice_sets

var _map = ds_map_create();

var _csv = load_csv("dice_sets.csv");

if (_csv == -1) {
	show_debug_message("ERROR: No dice file found.");
	return _map;
}

var _h = ds_grid_height(_csv);
var _c1, _c2;

var _i = 1;
repeat (_h - 1) {		
	_c1 = _csv[# 0, _i]; // type
	_c2 = str_to_lst(_csv[# 1, _i], ",", false); // dice
	
	ds_map_add(_map, _c1, _c2);
	
	_i += 1;
}

ds_grid_destroy(_csv);

return _map;
