/// @desc load_rules_offense

var _map = ds_map_create();

var _csv = load_csv("offense.csv");
var _ph = ds_grid_height(_csv);
var _c1, _c2, _c3, _c4, _c5;

var _tmp_map_1 = ds_map_create();

var _pk_1 = noone;
var _i = 1;
repeat (_ph - 1) {		
	_c1 = _csv[# 0, _i]; // play
	_c2 = _csv[# 1, _i]; // roll
	_c3 = str_to_lst(_csv[# 2, _i], ",", false); // effects
	_c4 = str_to_lst(_csv[# 3, _i], ",", false);  // mods
	_c5 = str_to_lst(_csv[# 4, _i], ",", false); // desc
		
	// Don't add to the main map until the key is different
	if (_pk_1 != noone and _c1 != _pk_1) {
		ds_map_add_map(_map, _pk_1, _tmp_map_1);
		_tmp_map_1 = ds_map_create();
	}
	
	var _tmp_map_2 = ds_map_create();
	
	ds_map_replace(_tmp_map_2, "effects", _c3);
	ds_map_replace(_tmp_map_2, "mods",    _c4);
	ds_map_replace(_tmp_map_2, "desc",    _c5);
	
	ds_map_add_map(_tmp_map_1, _c2, _tmp_map_2);
	
	_pk_1 = _c1;	
	_i += 1;
}

// Since not adding until key was different,
//    need to add the last section here
ds_map_add_map(_map, _pk_1, _tmp_map_1);

ds_grid_destroy(_csv);

return _map;