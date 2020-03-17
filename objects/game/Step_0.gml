/// @description 


if (keyboard_check_pressed(vk_f5)) room_restart();
if (keyboard_check_pressed(vk_f4)) DEBUG = !DEBUG;

if (keyboard_check_pressed(ord("C"))) clear_dice = !clear_dice;

#region change # of dice to roll
if (mouse_wheel_up()   or keyboard_check_pressed(vk_pageup))   total_dice_to_roll += 1;
if (mouse_wheel_down() or keyboard_check_pressed(vk_pagedown)) total_dice_to_roll -= 1;
total_dice_to_roll = clamp(total_dice_to_roll, 1, 6);
#endregion

#region roll 2d die
if (keyboard_check_pressed(ord("R"))) {
	reset_dice();
	
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
		
	#region Roll #d6
	total_count = roll_random_dice(total_dice_to_roll, clear_dice);
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


#region roll 3d die
if (keyboard_check_pressed(vk_space)) {	
	// Roll solo play selector dice
	//var _id = roll_solo_dice();	
	//total_count = map_get_deep(global.map_pbf_dice, _id, "name");
	
	// Create objects that roll the dice based on "Game State" (IE: Which dice don't exist yet)
	if (!instance_exists(par_pbf_dice)) {
		// Randomly pick an offense play
		//var _plays = global.map_pbf_dice_sets[? "Plays"];
		//var _l = array_length_1d(_plays) - 1;
		//var _r = irandom(_l); _r = irandom(_l); _r = irandom(_l);
		//global.pbf_play_offense = _plays[@ _r];
		// TEST: Manually pick offense
		global.pbf_play_offense = "120";

		instance_create_layer(x, y, "Instances", obj_pbf_dice_solo_play_selector);
	} else if (!instance_exists(obj_pbf_dice_defense)) {
		instance_create_layer(x, y, "Instances", obj_pbf_dice_defense);
	} else if (!instance_exists(obj_pbf_dice_offense)) {
		instance_create_layer(x, y, "Instances", obj_pbf_dice_offense);
	} else if (!instance_exists(obj_pbf_dice_yardage)) {
		instance_create_layer(x, y, "Instances", obj_pbf_dice_yardage);
	} else {
		reset_dice();
	}
	
}
#endregion