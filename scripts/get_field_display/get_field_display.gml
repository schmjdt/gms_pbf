/// @desc get_field_display

var _result = [];

var _gfn  = global.field_names;
var _glfn = global.len_fn;
var _gf   = global.map_field;

var _i = 0;
repeat (_glfn) {
	var _k = _gfn[@ _i];
	var _v = string(_gf[? _k]);
	
	switch (_k) {
		case "team":
			if      (_v > 0) _v = "Home";
			else if (_v < 0) _v = "Away";
			else			 _v = "";
			break;
		case "ball":
			if (_v > 50) _v = _v + " Opp " + string(50 - (real(_v) - 50));
			else _v = "Own " + _v;
			break;
	}
	
	_result[@ _i] = _k + ": " + _v;
	_i += 1;
}

return _result;