if (has_fallen)
	return;

update_movement();

if (is_dead)
	return;

update_knife();
update_gun();