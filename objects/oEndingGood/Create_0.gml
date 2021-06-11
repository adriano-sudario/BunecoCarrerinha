oGame.play_soundtrack(stkCarrerinha);
has_player_reached_center = false;
font = fMono;
next_sentence = 0;
text_bottom = 450;
text_top = 150;
text_speed = .25;
font_scale = 1;
scale_speed = .1;
font_height = font_get_size(font);
has_reached_end = false;
is_holding_transition = true;

var equipped_knife = array_find(global.game_state.weapons, function(i, w) {
	return i.weapon == oKnife;
});
if (equipped_knife == noone)
	layer_sprite_destroy(layer_sprite_get_id("Assets", "gKnife"));

final_text = {
	text: "FIM",
	alpha: 0
};

ending_texts = [
	{
		text: "Neste solo corre BUNECO CARRERINHA",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Guerrilheiro ativista no MOVIMENTO CARRERISTA",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Lutou bravamente em prol da conquista pelo direito de CORRER",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "As vezes parado",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "As vezes pulando",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Mas NUNCA andando",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Agora, apos tantas milhas percorridas " + 
			"em busca da liberdade de CORRER",
		scale: 0,
		y: text_bottom,
	},
	{
		text: "Corre em busca de um novo sentido para VIVER",
		scale: 0,
		y: text_bottom,
	},
];