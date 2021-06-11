window_set_cursor(cr_none);
game_set_speed(60, gamespeed_fps);
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
margin = 32;
font = fMenu;
font_height = font_get_size(font);
horizontal_position = gui_width - margin;
starting_position_offset = 200;
items_speed = 10;
is_disabled = true;
has_all_items_arrived = false;
quit_item = {
	x: 0,
	y: 0,
	text: "Quit",
	on_selected: function() {
		game_end();
	}
};
fullscreen_item = {
	x: 0,
	y: 0,
	text: "Fs On",
	on_selected: function() {
		oGame.toggle_fullscreen();
	}
};
continue_item = {
	x: 0,
	y: 0,
	text: "Continue",
	on_selected: function() {
		if (!file_exists(SAVE_FILE))
			return;
		
		with(oMenu) {
			has_all_items_arrived = false;
			horizontal_position = gui_width + starting_position_offset;
		}
		slide_transition(TRANSITION_MODE.CLOSE, function() {
			load_game_state();
			room_goto(global.game_state.current_room);
			slide_transition(TRANSITION_MODE.OPEN);
		}, 250);
	}
};
new_game_item = {
	x: 0,
	y: 0,
	text: "New Game",
	on_selected: function() {
		with(oMenu) {
			has_all_items_arrived = false;
			horizontal_position = gui_width + starting_position_offset;
		}
		slide_transition(TRANSITION_MODE.CLOSE, function() {
			room_goto(Room1);
			slide_transition(TRANSITION_MODE.OPEN);
		}, 250);
	}
};

if (file_exists(SAVE_FILE))
	items = [quit_item, fullscreen_item, continue_item, new_game_item];
else
	items = [quit_item, fullscreen_item, new_game_item];

controls = controller(true);
current_down_held = controls.is_down_held();
current_up_held = controls.is_up_held();
previous_down_held = current_down_held;
previous_up_held = current_up_held;

for (var i = 0; i < array_length(items); i++) {
	var item = items[i];
	item.x = gui_width + starting_position_offset;
	if (i == 0)
		items[i].y = gui_height - margin;
	else
		items[i].y = items[i - 1].y - font_height - (font_height * .5);
}

selected_item = array_length(items) - 1;