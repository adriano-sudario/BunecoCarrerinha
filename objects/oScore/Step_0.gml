if (is_increasing) {
	font_scale = min(font_scale * 1.1, max_font_scale);
	if (font_scale >= max_font_scale)
		is_increasing = false;
} else if (font_scale > 1) {
	font_scale = max(1, font_scale * .9);
}