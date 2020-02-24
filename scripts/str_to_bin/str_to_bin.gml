/// @desc str_to_bin
/// @arg string

var _str = argument[0];
var _result = "";
var _list = ds_list_create();

var _q, _r, _i;
var _int = string_digits(_str);

if (_int < 0) return "NotImplementedError";
else if (_int == 0) return "0";
else if (_int == 1) return "1";

/* 
	12 : 2 = 6 + 0
	 6 : 2 = 3 + 0
	 3 : 2 = 1 + 1
	 1 : 2 = 0 + 1
	 
	 1100
*/

_i = 0;
_r = _int mod 2;
_q = _int div 2
ds_list_add(_list, string(_r));

while (_q > 0) {
	_i += 1;
	
	_r = _q mod 2;
	_q = _q div 2;	
	
	ds_list_add(_list, string(_r));
}


var _i = ds_list_size(_list) - 1;
repeat (ds_list_size(_list)) {
	_result += _list[| _i];	
	
	_i -= 1;
}

ds_list_destroy(_list);

return _result;

