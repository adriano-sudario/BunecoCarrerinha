if (!other.is_dead && 
	other.should_jump && 
	other.is_on_floor && 
	(other.horizontal_direction == direction_trigger
	|| direction_trigger == 0))
	other.vertical_force = -7;