/// @desc load_rules_defense

var _map = ds_map_create();

var _csv = load_csv("defense.csv");
var _ph = ds_grid_height(_csv);
var _c1, _c2, _c3, _c4, _c5;

var _tmp_map_1 = ds_map_create();
var _tmp_map_2 = ds_map_create();

var _pk_1 = noone;
var _pk_2 = noone;
var _i = 1;
repeat (_ph - 1) {		
	_c1 = _csv[# 0, _i]; // offense
	_c2 = _csv[# 1, _i]; // defense
	_c3 = _csv[# 2, _i]; // roll
	_c4 = str_to_lst(_csv[# 3, _i], ",", false); // effects
	_c5 = str_to_lst(_csv[# 4, _i], ",", true);  // mods
		
	// Don't add to the main map until the key is different
	if (_pk_2 != noone and _c2 != _pk_2) {
		ds_map_add_map(_tmp_map_1, _pk_2, _tmp_map_2);
		_tmp_map_2 = ds_map_create();
	}
	
	// Don't add to the main map until the key is different
	if (_pk_1 != noone and _c1 != _pk_1) {
		ds_map_add_map(_map, _pk_1, _tmp_map_1);
		_tmp_map_1 = ds_map_create();
	}
	
	var _tmp_map_3 = ds_map_create();
		
	ds_map_replace(_tmp_map_3, "effects", _c4);
	ds_map_replace(_tmp_map_3, "mods",    _c5);
	
	ds_map_add_map(_tmp_map_2, _c3, _tmp_map_3);
	
	_pk_1 = _c1;	
	_pk_2 = _c2;	
	_i += 1;
}

// Since not adding until key was different,
//    need to add the last section here
ds_map_add_map(_tmp_map_1, _pk_2, _tmp_map_2);
ds_map_add_map(_map, _pk_1, _tmp_map_1);

ds_grid_destroy(_csv);

return _map;
