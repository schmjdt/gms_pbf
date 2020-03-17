/// @description 

side = irandom_range(1, 6);

start_x = x;
start_y = y;

drop_move = true;
drop_done = false;

direction = irandom_range(0, 259);
item_dst = irandom_range(100, 260);
goal_x = x + lengthdir_x(item_dst, direction);
goal_y = y + lengthdir_y(item_dst, direction);

goal_s = random_range(.08, .15);
goal_done = 1;
collision_distance = 10;

//var _c = choose(c_red, c_lime, c_yellow);
//image_blend = _c;

image_speed = random_range(.5, 1);
image_index = irandom(image_number - 1);

depth = -1;

name = "Die";