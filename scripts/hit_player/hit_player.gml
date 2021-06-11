/// @function hit(victim, weapon, direction)

function hit_player(_weapon) {
	oPlayer.hp -= abs(_weapon.damage);
	oPlayer.flash_frames = 3;
	
	if (oPlayer.hp <= 0) {
		with(oScore)
			reset_kills();
		with (oPlayer.gun)
			instance_destroy();
		with (oPlayer.knife)
			instance_destroy();
		oPlayer.horizontal_force = 
			abs(lengthdir_x(6, direction)) * sign(oPlayer.x - x);
		oPlayer.vertical_force = lengthdir_y(4, direction) - 2;
		oPlayer.horizontal_direction = sign(oPlayer.horizontal_force);
		oPlayer.grv = .2;
		if (oPlayer.vertical_force < 0)
			oPlayer.y += oPlayer.vertical_force;
		screen_shake(6, 25);
		with (instance_create_layer(x, y, layer, oSfxDelay)) {
			sfx = sfxDeath;
			priority = 10;
		}
		game_set_speed(30, gamespeed_fps);
		oPlayer.is_dead = true;
		horizontal_direction = sign(other.x - x);
		image_xscale = horizontal_direction;
		spill_player_blood();
	}
}

function spill_player_blood() {
	var blood_x = oPlayer.x;
	var blood_y = oPlayer.y;
	var blood_direction = 0;
	
	if (sign(image_xscale) > 0) {
		blood_x = oPlayer.bbox_left;
		blood_direction = 180;
	} else {
		blood_x = oPlayer.bbox_right;
		blood_direction = 0;
	}
	var direction_margin = 25;

	if (!layer_exists("Particles"))
		layer_create(-1, "Particles");

	repeat(50)
		with (instance_create_layer(blood_x, blood_y, "Particles", oParticle)) {
			var blood_speed = random_range(3, 13);
			var dir = random_range(
				blood_direction - direction_margin,
				blood_direction + direction_margin);
			horizontal_speed = lengthdir_x(blood_speed, dir);
			vertical_speed = lengthdir_y(blood_speed, dir);
			particle_type = PARTICLE_TYPE.BLOOD;
			image_speed = random_range(.25, .5);
		}
}