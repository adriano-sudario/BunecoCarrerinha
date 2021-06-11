damage = 4;
stab_speed = 5;
is_forward = true;
max_distance = 25;
current_distance = 0;
has_hit = false;
owner = noone;
knife_direction = 1;

function stab() {
	if (owner.knife == noone || owner.is_stabbing)
		return;
	owner.is_stabbing = true;
	reset_variables();
	knife_direction = owner.image_xscale;
	image_xscale = knife_direction;
	
	audio_play_sound(sfxKnife, 3, false);
}

function reset_variables() {
	is_forward = true;
	current_distance = 0;
	has_hit = false;
}