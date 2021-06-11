current_text = "";
text = "";
text_length = 0;
current_text_length = 0;
text_speed = .25;
chars = 0;
text_height = 0;
text_width = 0;
margin = 10;
radius = 15;
font = fMono;
is_backwards = true;

function set_text(_text) {
	text = _text;
	text_length = string_length(text);
}