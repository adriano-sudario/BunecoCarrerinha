/// @function save_game_state()

#macro SAVE_FILE "save.bin"

function save_game_state() {
	var json_game_state = json_stringify(global.game_state);
	var length = 0;
	for (var i = 0; i < string_length(json_game_state); i++)
		length += 8;
	var buff = buffer_create(length, buffer_fixed, 1);
	buffer_write(buff, buffer_text, json_game_state);
	var compressed_buff = buffer_compress(buff, 0, buffer_tell(buff));
	buffer_save(compressed_buff, SAVE_FILE);
	buffer_delete(buff);
	buffer_delete(compressed_buff);
}