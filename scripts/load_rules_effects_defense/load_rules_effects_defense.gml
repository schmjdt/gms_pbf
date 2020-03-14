/// @desc load_rules_effects_defense

var _map = ds_map_create();

var _csv = load_csv("effects_defense.csv");
var _ph = ds_grid_height(_csv);
var _c1, _c2;

var _i = 1;
repeat (_ph - 1) {		
	_c1 = _csv[# 0, _i]; // id
	_c2 = _csv[# 1, _i]; // name
			
	ds_map_add(_map, _c1, _c2);
	
	_i += 1;
}

ds_grid_destroy(_csv);

return _map;
