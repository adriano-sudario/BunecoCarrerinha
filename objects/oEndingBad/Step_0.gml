if (instance_exists(oTransition) && is_holding_transition) {
	if (!oTransition.is_on_hold)
		is_holding_transition = oTransition.percent >= 1;
	return;
}

var texts_length = array_length(ending_texts);

if (!has_reached_end)
	has_reached_end = next_sentence >= texts_length
		&& ending_texts[texts_length - 1].scale == 0
		&& ending_texts[texts_length - 2].scale == 0;

if (has_reached_end) {
	final_text.alpha = min(final_text.alpha + .005, 1);
	return;
}

if (next_sentence < texts_length) {
	var next = ending_texts[next_sentence];
	next.scale = min(next.scale + scale_speed, 1);
}

for (var i = 0; i < texts_length; i++) {
	var sentence = ending_texts[i];
		
	if (i > next_sentence)
		break;
		
	if (sentence.y > text_top)
		sentence.y -= text_speed;
	else
		sentence.scale = max(0, sentence.scale - scale_speed);
		
	if (i == next_sentence && 
		sentence.y <= text_bottom - font_height - font_height) {
		next_sentence++;
		break;
	}
}