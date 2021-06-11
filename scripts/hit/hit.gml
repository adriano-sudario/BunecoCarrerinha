/// @function hit(victim, weapon, direction)

function hit(_victim, _weapon){
	if (_victim.is_dead 
		|| _weapon.owner == _victim 
		|| _weapon.owner.object_index == oEnemy)
		return;

	_victim.hp -= abs(_weapon.damage);
	_victim.flash_frames = 3;

	if (_victim.hp <= 0) {
		if (_weapon.owner.object_index == oPlayer 
			&& _victim.object_index == oEnemy)
			with(oScore)
				add_kill();
			
		with (_victim.gun)
			instance_destroy();
		
		with (_victim.knife)
			instance_destroy();
		
		audio_play_sound(sfxDeath, 10, false);
		_victim.is_dead = true;
		var dir = argument_count > 2 ? argument[2] : direction;
		_victim.horizontal_force = lengthdir_x(3, dir);
		_victim.vertical_force = lengthdir_y(3, dir) - 2;
		_victim.horizontal_direction = sign(_victim.horizontal_force);
		if (_victim.vertical_force < 0)
			_victim.y += _victim.vertical_force;
		screen_shake(6, 25);
	}
	
	spill_blood(_victim, _weapon);
}

function spill_blood(_victim, _weapon) {
	var blood_x = x;
	var blood_y = y;
	
	if (!layer_exists("Particles"))
		layer_create(-1, "Particles");
	
	if (_weapon.object_index == oGun) {
		if (place_meeting(x, previous_y, _victim)) {
			var horizontal_direction = sign(current_x - previous_x);
			if (horizontal_direction < 0)
				blood_x = _victim.bbox_right;
			else if (horizontal_direction > 0)
				blood_x = _victim.bbox_left;
		}
	
		if (place_meeting(previous_x, y, _victim)) {
			var vertical_direction = sign(current_y - previous_y);
			if (vertical_direction < 0)
				blood_y = _victim.bbox_bottom;
			else if (vertical_direction > 0)
				blood_y = _victim.bbox_top;
		}
	} else {
		if (sign(image_xscale) > 0)
			blood_x = _victim.bbox_left;
		else
			blood_x = _victim.bbox_right;
	}

	var blood_direction = 0;

	if (direction >= 180)
		blood_direction = direction - 200 + 20;
	else
		blood_direction = direction + 200 - 20;
	var direction_margin = 20;

	repeat(round(random_range(7, 12)))
		with (instance_create_layer(blood_x, blood_y, "Particles", oParticle)) {
			var blood_speed = random_range(3, 5);
			var dir = random_range(
				blood_direction - direction_margin,
				blood_direction + direction_margin);
			horizontal_speed = lengthdir_x(blood_speed, dir);
			vertical_speed = lengthdir_y(blood_speed, dir);
			particle_type = PARTICLE_TYPE.BLOOD;
		}
}