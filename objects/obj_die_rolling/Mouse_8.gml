/// @description swap face

if (sprite_index == spr_faces_d6) {
	sprite_index = spr_3d_d6;
	image_index = 0;
	image_speed = .8;
} else {
	sprite_index = spr_faces_d6;
	image_index = 6;
	image_speed = 0;
}