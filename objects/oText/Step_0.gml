if ((current_text_length >= text_length && !is_backwards) ||
	(current_text_length <= 0 && is_backwards))
	return;

if (!is_backwards)
	chars += text_speed;
else
	chars -= text_speed * 2;

current_text = string_copy(text, 1, floor(chars));
current_text_length = string_length(current_text);

draw_set_font(fSign);
if (text_height = 0)
	text_height = string_height(text);
text_width = string_width(current_text);