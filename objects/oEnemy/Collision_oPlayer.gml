if (is_dead || other.is_dead || global.controls.is_disabled)
	return;

hit_player(knife);
knife.stab();