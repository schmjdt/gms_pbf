
// Clear out all the dice
with (par_pbf_dice) {
	instance_destroy();
}
		
global.pbf_play_offense = noone;
global.pbf_play_defense = noone;
global.pbf_effects_defense = noone;
global.pbf_effects_offense = noone;
global.pbf_effects_yardage = noone;

global.rolling = false;


global.die_modifier   = 0;
global.die_multiplier = 1;
global.die_amount     = 0;
global.die_values     = [];
global.die_bonus      = -1;

game.total_count = 0;