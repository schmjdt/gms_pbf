/// @description 

//randomize();

total_dice_to_roll = 1;
total_count = 0;

global.rolling = false;
solo_result = "";

DEBUG = false;
 
#region Setup Field

enum Team {
	away = -1,
	home = 1,
}

quarter = 1;
down = 1;
yards_to_first = 10;
ball_position = 20;

/*

0   10      50     10   0
|----|--..--|--..--|----|
0   10      50     90  100

When displaying, if position > 50, then display_pos = position - 50;

When moving ball, position += distance * possession
*/

possession = Team.home;

// # of plays left for the quarter
time = 30;
// Team Stats
// rushing, passing, interceptions, turnovers

// Game Stats
num_of_quarters = 4;
starting_time = 30;

#endregion

#region Load CSVs

map_pbf_dice = script_execute(load_dice);

//pbf_plays_map = script_execute(load_basic_solo_play_selector_dice);
pbf_play_selector_map = script_execute(load_rules_basic_solo_play_selector);

/* Test String Parsing:
	// Ranges
	var _s = "1";
	var _s = "4-8";
	
	// Modifiers
	var _s = "[0,-1,-2]"
*/

#endregion