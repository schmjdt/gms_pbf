/// @description 

//randomize();

total_dice_to_roll = 1;
total_count = 0;

global.rolling = false;
solo_result = "";

DEBUG = false;


map_pbf_dice = script_execute(load_dice);

//pbf_plays_map = script_execute(load_basic_solo_play_selector_dice);
//pbf_play_selector_map = script_execute(load_rules_basic_solo_play_selector);

/* Test String Parsing:
	// Ranges
	var _s = "1";
	var _s = "4-8";
	
	// Modifiers
	var _s = "[0,-1,-2]"
*/
