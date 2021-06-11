if (current_text_length <= 0)
	return;

var half_width = text_width * .5;

draw_set_color(c_black);
draw_set_alpha(.5);
draw_roundrect_ext(
	x - half_width - margin,
	y - text_height - (margin * 2),
	x + half_width + margin,
	y, radius, radius, false
);
draw_sprite(sMark, 0, x, y);
draw_set_alpha(1);

prepare_text_draw(font, fa_center, fa_top, c_white);
draw_text(x, y - text_height - margin, current_text);
