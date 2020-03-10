/// @desc load_rules_basic_solo_play_selector

var _map = ds_map_create();

var _csv = load_csv("dice.csv");

if (_csv == -1) {
	show_debug_message("ERROR: No dice file found.");
	return _map;
}

var _h = ds_grid_height(_csv);
var _c1, _c2, _c3, _c4, _c5;

//var _tmp_map_1 = ds_map_create();

var _pk = noone;
var _i = 1;
repeat (_h - 1) {		
	_c1 = _csv[# 0, _i]; // id
	_c2 = _csv[# 1, _i]; // name
	_c3 = str_to_color(_csv[# 2, _i]); // color
	_c4 = str_to_lst(_csv[# 3, _i], ",", true); // scale
	_c5 = _csv[# 4, _i]; // type
		
	// Don't add to the main map until the key is different
	//if (_pk != noone and _c1 != _pk) {
	//	ds_map_add_map(_map, _pk, _tmp_map_1);
	//	_tmp_map_1 = ds_map_create();
	//}
	
	var _tmp_map_2 = ds_map_create();
		
	ds_map_replace(_tmp_map_2, "name",  _c2);
	ds_map_replace(_tmp_map_2, "color", _c3);
	ds_map_replace(_tmp_map_2, "scale", _c4);
	ds_map_replace(_tmp_map_2, "type",  _c5);
	
	//ds_map_add_map(_tmp_map_1, _c2, _tmp_map_2);
	ds_map_add_map(_map, _c1, _tmp_map_2);
	
	_pk = _c1;	
	_i += 1;
}

// Since not adding until key was different,
//    need to add the last section here
//ds_map_add_map(_map, _pk, _tmp_map_1);

ds_grid_destroy(_csv);

return _map;
