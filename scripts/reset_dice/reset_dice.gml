
// Clear out all the dice
with (par_pbf_dice) {
	instance_destroy();
}
		
global.pbf_play_offense = noone;
global.pbf_play_defense = noone;
global.pbf_effects_defense = noone;
global.pbf_effects_offense = noone;

global.rolling = false;

game.total_count = 0;