/// @description 

event_inherited();

var _id = roll_solo_dice();
game.total_count = map_get_deep(global.map_pbf_dice, _id, "name");

global.pbf_play_defense = _id;