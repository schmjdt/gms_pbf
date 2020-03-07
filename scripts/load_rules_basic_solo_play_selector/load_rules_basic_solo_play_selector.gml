/// @desc load_rules_basic_solo_play_selector

var _map = ds_map_create();

var _csv = load_csv("basic_solo_play_selector.csv");
var _ph = ds_grid_height(_csv);
var _d, _y, _p, _m;

var _tmp_map_1 = ds_map_create();

var _pk = noone;
var _i = 1;
repeat (_ph - 1) {		
	_d = _csv[# 0, _i];
	_y = _csv[# 1, _i];
	_p = str_to_lst(_csv[# 2, _i], true);
	_m = str_to_lst(_csv[# 3, _i], true);
		
	// Don't add to the main map until the key is different
	if (_pk != noone and _d != _pk) {
		ds_map_add_map(_map, _pk, _tmp_map_1);
		_tmp_map_1 = ds_map_create();
	}
	
	var _tmp_map_2 = ds_map_create();
		
	ds_map_replace(_tmp_map_2, "play", _p);
	ds_map_replace(_tmp_map_2, "mods",  _m);
	
	ds_map_add_map(_tmp_map_1, _y, _tmp_map_2);
	
	_pk = _d;	
	_i += 1;
}

// Since not adding until key was different,
//    need to add the last section here
ds_map_add_map(_map, _pk, _tmp_map_1);

ds_grid_destroy(_csv);

return _map;
