if (!instance_exists(oPlayer) || (global.game_state.kills <= 0 && !oPlayer.is_dead))
	return;

var margin = 10;
var position_x = RESOLUTION_WIDTH - margin;
var position_y = margin;
prepare_text_draw(font, fa_right, fa_top);
if (oPlayer.is_dead) {
	var offset = 2;
	var offset_x = random_range(-offset, offset);
	var offset_y = random_range(-offset, offset);
	draw_outlined_text_transformed(
		position_x + offset_x, position_y + offset_y, "VOCE RODOU!", 1);
} else {
	var text = string(global.game_state.kills) + " seresumanos rodaram.";
	if (global.game_state.kills == 1)
		text = string(global.game_state.kills) + " serumano rodou.";
	draw_outlined_text_transformed(position_x, position_y, text, font_scale);
}