/// @description 

#region Setup Die

global.rolling = false;

var _r = -1;
var _g = -1;
var _b = -1;
var _h = -1;
var _s = -1;
var _v = -1;
var _die_x_o, _die_y_o;

with (obj_die_rolling) {
	_die_x_o = x - (sprite_width / 3);
	_die_y_o = y - (sprite_height / 2);
	
	_r = color_get_red(image_blend);
	_g = color_get_green(image_blend);
	_b = color_get_blue(image_blend);
	_h = color_get_hue(image_blend);
	_s = color_get_saturation(image_blend);
	_v = color_get_value(image_blend);
	
	drop_move = false;
}

die_rgb = int_to_hex(_r) + int_to_hex(_g) + int_to_hex(_b);
die_hsv = int_to_hex(_h) + int_to_hex(_s) + int_to_hex(_v);

die_rgb_x = _die_x_o;
die_rgb_y = _die_y_o - 20;

die_hsv_x = _die_x_o;
die_hsv_y = _die_y_o;

#endregion

#region Setup Vars

global.view_width  = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

display_set_gui_size(global.view_width, global.view_height);

inputting = false;

#endregion

#region Keybinds

global.control_revert = ord("X");
global.control_enter  = vk_enter;
global.control_left	  = vk_left;
global.control_right  = vk_right;
global.control_up	  = vk_up;
global.control_down   = vk_down;
 
#endregion

#region Menu Enums

enum menu_page {
	//colors,
	rgb,
	//hsv,
	_size
}

enum menu_element_type {
	script_runner,
	page_transfer,
	slider,
}

#endregion

#region Create Menu Pages

//ds_menu_colors = create_menu_page(
//	["RGB",		menu_element_type.page_transfer, menu_page.rgb],
//	["HSV",		menu_element_type.page_transfer, menu_page.hsv],
//	["SAVE",	menu_element_type.script_runner, save_color]
//);

ds_menu_rgb = create_menu_page(
	["R",		menu_element_type.slider,		  change_rgb,	  _r,	[0,255]],
	["G",		menu_element_type.slider,		  change_rgb,	  _g,	[0,255]],
	["B",		menu_element_type.slider,		  change_rgb,	  _b,	[0,255]],
	["SAVE",	menu_element_type.script_runner, save_color]
	//["BACK",	menu_element_type.page_transfer,  menu_page.colors]
);

//ds_menu_hsv = create_menu_page(
//	["H",		menu_element_type.slider,		  change_hsv,	  _h,	[0,255]],
//	["S",		menu_element_type.slider,		  change_hsv,	  _s,	[0,255]],
//	["V",		menu_element_type.slider,		  change_hsv,	  _v,	[0,255]],
//	["BACK",	menu_element_type.page_transfer,  menu_page.colors]
//);

#endregion

#region Pages

page = 0;

// NOTE: Must be the same order as the enum menu_page
menu_pages = [
	//ds_menu_colors,
	ds_menu_rgb, 
	//ds_menu_hsv
];

var _i = 0;
var _len = array_length_1d(menu_pages);
repeat (_len) {
	menu_option[_i] = 0;
	_i += 1;
}

#endregion

