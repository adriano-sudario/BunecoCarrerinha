var horizontal_position = RESOLUTION_WIDTH * .5;

prepare_text_draw(font, fa_center, fa_center);
if (has_reached_end) {
	var vertical_position = RESOLUTION_HEIGHT * .5;
	draw_set_alpha(final_text.alpha);
	draw_outlined_text_transformed(horizontal_position, vertical_position, 
		final_text.text, 1);
} else {
	for (var i = 0; i < array_length(ending_texts); i++) {
		var sentence = ending_texts[i];
		draw_outlined_text_transformed(horizontal_position, sentence.y, 
			sentence.text, sentence.scale);
	}
}