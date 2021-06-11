if (is_destroyed
	|| x < -sprite_width
	|| y < -sprite_height
	|| x > room_width + sprite_width
	|| y > room_height + sprite_height) {
	instance_destroy();
	return;
}

if (image_speed != 0 && image_index > 0) {
	image_speed = 0;
	image_index = gun.owner.object_index == oPlayer ? 1 : 2;
}

previous_x = current_x;
previous_y = current_y;
current_x = x;
current_y = y;

var wall = instance_place(x, y, oWall);
if (wall != noone) {
	var dust_x = x;
	var dust_y = y;
	
	if (place_meeting(x, previous_y, wall)) {
		var horizontal_direction = sign(current_x - previous_x);
		if (horizontal_direction < 0)
			dust_x = wall.bbox_right;
		else if (horizontal_direction > 0)
			dust_x = wall.bbox_left;
	}
	
	if (place_meeting(previous_x, y, wall)) {
		var vertical_direction = sign(current_y - previous_y);
		if (vertical_direction < 0)
			dust_y = wall.bbox_bottom;
		else if (vertical_direction > 0)
			dust_y = wall.bbox_top;
	}
	
	var dust_direction = direction - 180;
	var direction_margin = 20;
	repeat(round(random_range(4, 7)))
		with (instance_create_layer(dust_x, dust_y, "Bullets", oParticle)) {
			var dust_speed = random_range(1, 3);
			var dir = random_range(
				dust_direction - direction_margin,
				dust_direction + direction_margin);
			horizontal_speed = lengthdir_x(dust_speed, dir);
			vertical_speed = lengthdir_y(dust_speed, dir);
			particle_type = PARTICLE_TYPE.DIRT;
		}
	is_destroyed = true;
}