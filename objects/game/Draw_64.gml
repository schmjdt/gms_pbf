/// @description 

var _c = c_black;
draw_text_color(10, 10, "Amount: " + string(total_dice_to_roll), _c, _c, _c, _c, 1);

var _count = string(total_count);
if (global.rolling) _count = "rolling..."

draw_text_color(10, 30, "Total : " + _count, _c, _c, _c, _c, 1);
draw_text_color(10, 50, "mask  : " + str_to_bin(global.rolling), _c, _c, _c, _c, 1);

draw_text_color(10, 100, "Down : " + string(down), _c, _c, _c, _c, 1);
draw_text_color(10, 120, "Ball : " + string(ball_position), _c, _c, _c, _c, 1);

if (DEBUG) {
	with (obj_die_rolling) {
		if (drop_move) {
			var _c = c_yellow;
			draw_line_width_color(start_x, start_y, goal_x, goal_y, 3, _c, _c);	
			_c = c_black;
			draw_text_color(goal_x, goal_y, string(abs(start_x - goal_x)), _c, _c, _c, _c, 1)
			draw_text_color(goal_x, goal_y + 10, string(direction), _c, _c, _c, _c, 1)
		}
	}
}