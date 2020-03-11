/// @description 

var _c = c_black;

var _count = string(total_count);
if (global.rolling) _count = "rolling..."

var _rolls = [
	"Amount: " + string(total_dice_to_roll),
	"Total: " + _count,
	"mask: " + str_to_bin(global.rolling)
]

var _stats = [
	"Down: " + string(down),
	"First: " + string(yards_to_first),
	"Ball: " + string(ball_position)
]

draw_gui_text(_rolls, 10, 10, _c);
draw_gui_text(_stats, 10, 100, _c);

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