/// @function controller(r, g, b)

function draw_with_fill_color_shader(_r, _g, _b){
	shader_set(shFillColor);
	var r = shader_get_uniform(shFillColor, "r_value");
	var g = shader_get_uniform(shFillColor, "g_value");
	var b = shader_get_uniform(shFillColor, "b_value");
	shader_set_uniform_f(r, _r / 255);
	shader_set_uniform_f(g, _g / 255);
	shader_set_uniform_f(b, _b / 255);
	draw_self();
	shader_reset();
}