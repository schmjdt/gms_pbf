/// @description 

var _c = c_black;

var _mDice = global.map_pbf_dice;

var _count = string(total_count);
if (global.rolling) _count = "rolling..."

var _rolls = [
	"Amount: " + string(total_dice_to_roll),
	"Total: " + _count,
	"mask: " + str_to_bin(global.rolling)
]

var _stats = get_field_display();

var _play_offense = noone; if (global.pbf_play_offense != noone) _play_offense = map_get_deep(_mDice, global.pbf_play_offense, "name"); 
var _play_defense = noone; if (global.pbf_play_defense != noone) _play_defense = map_get_deep(_mDice, global.pbf_play_defense, "name");
var _effect_defense = global.pbf_effects_defense;
var _effect_offense = global.pbf_effects_offense;

if (_play_offense == noone) _play_offense = "";
if (_play_defense == noone   or (!instance_exists(obj_pbf_dice_defense) and global.rolling)) _play_defense = "";
if (_effect_defense == noone or (!instance_exists(obj_pbf_dice_offense) and global.rolling)) _effect_defense = "";
if (_effect_offense == noone or (!instance_exists(obj_pbf_dice_yardage) and global.rolling)) _effect_offense = "";

var _plays = [
	"Offense: " + string(_play_offense),
	"Defense: " + string(_play_defense),
	"Defense Effect: " + string(_effect_defense),
	"Offense Effect: " + string(_effect_offense),
]

var _y = 10;
_y = draw_gui_text(_rolls, 10, _y, _c);
_y = draw_gui_text(_plays, 10, _y, _c);
_y = draw_gui_text(_stats, 10, _y, _c);

if (DEBUG) {
	with (obj_die_rolling) {
		if (drop_move) {
			var _c = c_white;
			draw_line_width_color(start_x, start_y, goal_x, goal_y, 3, _c, _c);	
			_c = c_black;
			draw_text_color(goal_x, goal_y, string(abs(start_x - goal_x)), _c, _c, _c, _c, 1)
			draw_text_color(goal_x, goal_y + 10, string(direction), _c, _c, _c, _c, 1)
		}
	}
}