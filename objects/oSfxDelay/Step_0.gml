if (delay == 0) {
	audio_play_sound(sfx, priority, false);
	audio_sound_gain(sfx, gain, 0);
	gain -= 1 / feedback;
	
	if (gain <= 0) {
		//audio_sound_gain(sfx, 1, 0);
		instance_destroy();
	}
}

delay++;

if (delay >= frames_per_sound)
	delay = 0;