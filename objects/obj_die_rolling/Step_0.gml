/// @description Insert description here
// You can write your code in this editor

//if (place_meeting(abs(x - goal_x) + goal_s, y, obj_die_rolling) or
//    place_meeting(x, abs(y - goal_y) + goal_s, obj_die_rolling)) {
//	exit;
//}
			
if (drop_move) {
	x = lerp(x, goal_x, goal_s);
	y = lerp(y, goal_y, goal_s);
	
	if (abs(x - goal_x) < goal_done and abs(y - goal_y) < goal_done) {
		drop_move = false;	
	}
} else if (!drop_move and !drop_done) {
	game.rolling = game.rolling >> 1;	
	sprite_index = spr_faces_d6;
	image_index = side;
	image_speed = 0;
	depth = 0;
	
	drop_done = true;
}