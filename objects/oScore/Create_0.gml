kills_before_death = 0;
font = fMono;
font_scale = 1;
max_font_scale = 1.5;
is_increasing = false;

function add_kill() {
	global.game_state.kills++;
	font_scale = 1;
	is_increasing = true;
}

function reset_kills() {
	global.game_state.kills = kills_before_death;
}