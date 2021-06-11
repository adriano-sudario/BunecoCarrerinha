/// @function load_game_state()

function load_game_state() {
	var buffer = buffer_load("save.bin");
	var decompressed_buffer = buffer_decompress(buffer);
	var json_game_state = buffer_read(decompressed_buffer, buffer_string);
	global.game_state = json_parse(json_game_state);
	buffer_delete(buffer);
	buffer_delete(decompressed_buffer);
}