if (owner == noone)
	return;

if (owner.is_stabbing) {
	current_distance += stab_speed * (is_forward ? 1 : -1);
	if (is_forward && current_distance >= max_distance) {
		is_forward = false;
		current_distance = max_distance;
	} else if (!is_forward && current_distance <= 0) {
		owner.is_stabbing = false;
	}
}

x = owner.x + (current_distance * sign(knife_direction));
y = owner.y + 10;