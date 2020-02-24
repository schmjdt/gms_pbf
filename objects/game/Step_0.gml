/// @description 

if (keyboard_check_pressed(vk_f5)) room_restart();
if (keyboard_check_pressed(vk_f4)) DEBUG = !DEBUG;

#region roll 2d die
//if (keyboard_check_pressed(ord("R"))) {
if (mouse_check_button_pressed(mb_right)) {
	#region obj_die
	with (obj_die) {
		image_angle = irandom_range(3, 7) * 45;		
	}
	#endregion
	
	#region obj_custom_die
	with (obj_custom_die) {
		var _side = irandom_range(1, 6);
		var _rotate = random(4) * 45;
		
		side = _side;
		
		image_angle = _rotate;		
	
		var _r = irandom(255);
		var _g = irandom(255);
		var _b = irandom(255);
	
		color_face = make_color_rgb(_r, _g, _b);	
		color_pips = make_color_rgb(255 - _r, 255 - _g, 255 - _b);	
	}
	#endregion
} 
#region set die 1-6
else if (keyboard_check_pressed(ord("1"))) { with (obj_die) side = 1 };
else if (keyboard_check_pressed(ord("2"))) { with (obj_die) side = 2 };
else if (keyboard_check_pressed(ord("3"))) { with (obj_die) side = 3 };
else if (keyboard_check_pressed(ord("4"))) { with (obj_die) side = 4 };
else if (keyboard_check_pressed(ord("5"))) { with (obj_die) side = 5 };
else if (keyboard_check_pressed(ord("6"))) { with (obj_die) side = 6 };
#endregion
#endregion

#region change # of dice to roll
if (mouse_wheel_up())   total_dice_to_roll += 1;
if (mouse_wheel_down()) total_dice_to_roll -= 1;
total_dice_to_roll = clamp(total_dice_to_roll, 1, 6);
#endregion

#region roll 3d die
if (mouse_check_button_pressed(mb_right)) {
	total_count = 0;
	rolling = 0x3f >> (6 - total_dice_to_roll);
	
	with (obj_die_rolling) {
		//instance_destroy();	
	}
	
	repeat (total_dice_to_roll) {
		var _inst = instance_create_layer(
			mouse_x + irandom_range(-64, 64), mouse_y + irandom_range(-64, 64), 
			"Instances", obj_die_rolling
		);
	
		//var _ld = last_dir; 
	
		//with (_inst) {
		//	direction = _ld;
		//	item_dir = direction;
		//	goal_x = x + lengthdir_x(item_dst, item_dir);
		//	goal_y = y + lengthdir_y(item_dst, item_dir);
			
		//}
		
		//if (last_dir == init_dir) last_dir = 90;
		//else last_dir = init_dir;
		
		total_count += _inst.side + 1;
	}
}
#endregion