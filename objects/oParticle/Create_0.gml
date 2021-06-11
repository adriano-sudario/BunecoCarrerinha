enum PARTICLE_TYPE {
	DUST,
	DIRT,
	BLOOD
}

image_speed = random_range(.5, 1);
image_index = random_range(0, 6);
image_xscale = choose(-1, 1);
image_yscale = choose(-1, 1);
horizontal_speed = random_range(-2, 2);
vertical_speed = random_range(-2, 2);
particle_type = PARTICLE_TYPE.DUST;