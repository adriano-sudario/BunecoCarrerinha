if (other.is_dead)
	return;

other.horizontal_direction = level_direction;
other.controls.is_disabled = true;
slide_transition(TRANSITION_MODE.CLOSE, function() {
	room_goto(level_target);
	slide_transition(TRANSITION_MODE.OPEN);
});