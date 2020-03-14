/// @description 

//randomize();

total_dice_to_roll = 1;
total_count = 0;

global.rolling = false;

DEBUG = false;
 
#region Setup Field

enum Team {
	away = -1,
	home = 1,
}

#region Load Stat CSVs

max_quarter		= 4;
initial_quarter = 1;
initial_time	= 30;

#endregion

#region Clock Stats

time	= initial_time;
quarter = initial_quarter;

#endregion

#region Field Stats

// TODO: Load from csv?
global.field_names = ["team", "down", "first", "ball"];
global.len_fn = array_length_1d(global.field_names);

global.map_field = ds_map_create();

var _i = 0;
repeat (global.len_fn) {
	var _k = global.field_names[@ _i];
	var _n = 1;
	
	// TODO: Temp to load random data instead of from save file
	if (_k == "Team") global.map_field[? _k] = choose(Team.away, Team.home);
	else {
		switch (_i) {
			case 1: _n = 4; break;
			case 2: _n = 15; break;
			case 3: _n = 99; break;
		}		
		
		global.map_field[? _k] = irandom_range(1, _n);
	}
	
	_i += 1;
}

#endregion

#region Team Stats

// rushing, passing, interceptions, turnovers

#endregion

#endregion

#region Load CSVs

global.map_pbf_dice		 = load_dice();
global.map_pbf_dice_sets = load_dice_sets();

global.map_pbf_rules_solo_play_selector = load_rules_basic_solo_play_selector();
global.map_pbf_rules_defense = load_rules_defense();
global.map_pbf_rules_effects_defense = load_rules_effects_defense();

#endregion

#region Test Code

global.pbf_play_offense = noone;
global.pbf_play_defense = noone;
global._pbf_effects_defense = noone;
global._pbf_effects_offense = noone;

#endregion