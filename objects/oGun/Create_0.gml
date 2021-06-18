damage = 1;
firing_delay = 0;
recoil = 0;
owner = noone;

function shoot() {
	if (firing_delay >= 0)
		return;
	firing_delay = 5;
	recoil = 4;
	
	if (owner.object_index == oPlayer)
		screen_shake(2, 10);
	
	audio_sound_pitch(sfxShoot, choose(.8, 1, 1.2));
	audio_play_sound(sfxShoot, 5, false);
	
	if (!layer_exists("Bullets"))
		layer_create(-1, "Bullets");
	
	with (instance_create_layer(x, y, "Bullets", oBullet)) {
		gun = other;
		speed = gun.owner.object_index == oPlayer ? 25 : 10;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}