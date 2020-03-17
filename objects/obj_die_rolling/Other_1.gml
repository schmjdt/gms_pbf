/// @description

var _c = false;
if (bbox_left < 0 or bbox_right > room_width) {
	//direction = point_direction(-x, y, x, y);
	//_c = true;
}

if (bbox_top < 0 or bbox_bottom > room_height) {
	//direction = point_direction(x, -y, x, y);
	//_c = true;
}

if (_c) {
	item_dst = 3;
	goal_s = 1;

	goal_x = x + lengthdir_x(item_dst, direction);
	goal_y = y + lengthdir_y(item_dst, direction);		
}