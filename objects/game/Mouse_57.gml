/// @description roll 3d dice

#region roll 3d die
if (mouse_check_button_released(mb_right)) {
	show_debug_message("Mouse was released!");
	// Roll #d6
	//total_count = roll_random_dice(total_dice_to_roll);
	
	// Roll solo play selector dice
	//var _id = roll_solo_dice();	
	//total_count = map_get_deep(global.map_pbf_dice, _id, "name");
	
	// Create objects that roll the dice based on "Game State" (IE: Which dice don't exist yet)
	if (!instance_exists(par_pbf_dice)) {
		// Randomly pick an offense play
		var _plays = global.map_pbf_dice_sets[? "Plays"];
		var _l = array_length_1d(_plays) - 1;
		var _r = irandom(_l); _r = irandom(_l); _r = irandom(_l);
		global.pbf_play_offense = _plays[@ _r];

		instance_create_layer(x, y, "Instances", obj_pbf_dice_solo_play_selector);
	} else if (!instance_exists(obj_pbf_dice_defense)) {
		instance_create_layer(x, y, "Instances", obj_pbf_dice_defense);
	} else if (!instance_exists(obj_pbf_dice_offense)) {
		instance_create_layer(x, y, "Instances", obj_pbf_dice_offense);
	} else if (!instance_exists(obj_pbf_dice_yardage)) {
		instance_create_layer(x, y, "Instances", obj_pbf_dice_yardage);
	} else {
		// Clear out all the dice
		with (par_pbf_dice) {
			instance_destroy();
		}
		
		global.pbf_play_offense = noone;
		global.pbf_play_defense = noone;
		global._pbf_effects_defense = noone;
		global._pbf_effects_offense = noone;
		global.rolling = false;
		total_count = 0;
	}
	
}
#endregion