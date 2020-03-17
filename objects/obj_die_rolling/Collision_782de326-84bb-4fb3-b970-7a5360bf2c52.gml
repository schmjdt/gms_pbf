/// @description 

if (!(abs(x - goal_x) < collision_distance and abs(y - goal_y) < collision_distance)) {
	exit;
}

direction = point_direction(other.x, other.y, x, y);

item_dst = 3;
goal_s = 1;

goal_x = x + lengthdir_x(item_dst, direction);
goal_y = y + lengthdir_y(item_dst, direction);

with (other) {	
	if (drop_move == false) drop_move = true;
	//x = clamp(x, sprite_width / 2, room_width - sprite_width / 2);
	//y = clamp(y, sprite_height / 2, room_height - sprite_height / 2);
}

