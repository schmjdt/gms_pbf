/// @description 

//if (just_spawned) exit;
if (!(abs(x - goal_x) < collision_distance and abs(y - goal_y) < collision_distance)) {
	exit;
}

direction = point_direction(other.x, other.y, x, y);


//item_dir += 180;
//if (item_dir > 360) item_dir -= 360;

item_dst = 3;
goal_s = 1;

goal_x = x + lengthdir_x(item_dst, direction);
goal_y = y + lengthdir_y(item_dst, direction);

with (other) {
//	direction = _tmp;
//	item_dir = direction;
	
//	if (drop_done) {
//		item_dst = 1;
//		goal_s = .25;
//	} else item_dst = irandom_range(20, 90);
	
//	goal_x = x + lengthdir_x(item_dst, item_dir);
//	goal_y = y + lengthdir_y(item_dst, item_dir);
	
	if (drop_move == false) drop_move = true;
}

