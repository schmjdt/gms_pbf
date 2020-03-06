pbf_plays_map = ds_map_create();

var _plays = load_csv("plays.csv");
var _ph = ds_grid_height(_plays);
var _n, _c;

var _i = 1;
repeat (_ph - 1) {
	var _tmp_map = ds_map_create();

	_n = _plays[# 1, _i];
	_c = str_to_color(_plays[# 2, _i]);
	
	ds_map_replace(_tmp_map, "play",  _n);
	ds_map_replace(_tmp_map, "color", _c);
	
	ds_map_add_map(pbf_plays_map, _plays[# 0, _i], _tmp_map);
	
	_i += 1;
}

ds_grid_destroy(_plays);
